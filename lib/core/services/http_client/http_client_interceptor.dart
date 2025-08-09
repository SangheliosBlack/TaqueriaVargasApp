// ignore_for_file: unnecessary_overrides

import 'package:dio/dio.dart';
import 'package:taqueria_vargas/core/constants/constants.dart';
import 'package:taqueria_vargas/core/services/local_storage/local_storage_service.dart';


class HttpClientInterceptor extends Interceptor {

  final LocalStorageService localStorageService;

  HttpClientInterceptor({required this.localStorageService});

  @override
Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

  if (!_isPublicEndpoint(options.path)) {

    final accessToken = await localStorageService.getValue(key: LocalStorageKeys.ACCESS_TOKEN);

    if (accessToken != null) {

      options.headers["Authorization"] = "Bearer $accessToken";

    } else {

      //print("No se encontró un token de acceso. Es posible que el usuario deba iniciar sesión nuevamente.");

    }

  }

  options.headers.putIfAbsent("Content-Type", () => "application/json; charset=utf-8");

  super.onRequest(options, handler);
}

bool _isPublicEndpoint(String path) {

  const publicEndpoints = [
    '/auth/login', 
    '/auth/register',
  ];

  return publicEndpoints.any((endpoint) => path.contains(endpoint));
  
}


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {

    if (err.type == DioExceptionType.connectionTimeout) {
      handler.next(DioException(
      requestOptions: err.requestOptions,
      error: "La conexión tardó demasiado. Por favor, verifica tu internet.",
      response: err.response,
      message: "La conexión tardó demasiado. Por favor, verifica tu internet.",
      ));
      return;
    }
    if (err.type == DioExceptionType.receiveTimeout) {
      handler.next(DioException(
      requestOptions: err.requestOptions,
      error: "El servidor tardó demasiado en responder.",
      response: err.response,
      message: "El servidor tardó demasiado en responder.",
      ));
      return;
    }
    if (err.type == DioExceptionType.sendTimeout) {
      handler.next(DioException(
      requestOptions: err.requestOptions,
      error: "El envío de datos tardó demasiado.",
      response: err.response,
      message: "El envío de datos tardó demasiado.",
      ));
      return;
    }
    
    if (err.response?.statusCode == 401) {

      final requestPath = err.requestOptions.path;

      if (requestPath.contains('/auth/login') || requestPath.contains('/register')) {

        //print("Error 401 en $requestPath: Credenciales inválidas, no se requiere refresh token.");

        final errorMessage = err.response?.data != null ? err.response?.data["message"] ?? "Unauthorized" : "Unauthorized";

        handler.next(DioException(
          requestOptions: err.requestOptions,
          error: errorMessage,
          response: err.response,
          message: errorMessage
        ));

        return;
      
      }

      try {
        await refreshToken();
        handler.resolve(await _retry(err.requestOptions));
      } catch (e) {
        handler.next(DioException(
          requestOptions: err.requestOptions,
          error: "Token refresh failed: $e",
        ));
      }
      return;
    }

    handler.next(err);
  }

  Future<void> refreshToken() async {

    final refreshToken = await localStorageService.getValue(key: LocalStorageKeys.ACCESS_TOKEN);

    if (refreshToken == null) {

      throw Exception("Refresh token not found");

    }

    try {


      final dio = Dio(
        BaseOptions(
          baseUrl: '${Environments.PATH_URL}/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}'
        ),
      );

      final response = await dio.post(
        '/auth/refresh',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $refreshToken",
          },
        ),
      );

      await localStorageService.setValue(key: LocalStorageKeys.ACCESS_TOKEN, value: response.data["data"]["accessToken"].toString());
    } catch (e) {
      throw Exception("Failed to refresh token: $e");
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final accessToken = await localStorageService.getValue(key: LocalStorageKeys.ACCESS_TOKEN);

    if (accessToken == null) {
      throw Exception("Access token not found");
    }

    final options = Options(
      method: requestOptions.method,
      headers: {
        "Authorization": "Bearer $accessToken",
      },
    );

    return Dio(
      BaseOptions(
        baseUrl: Environments.PATH_URL,
      ),
    ).request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
