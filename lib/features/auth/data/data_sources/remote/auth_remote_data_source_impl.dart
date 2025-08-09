import 'package:dio/dio.dart';
import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/auth/data/dtos/dtos.dart';
import 'package:taqueria_vargas/features/auth/domain/domain.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  final HttpClientServiceImpl httpClientService;

  AuthRemoteDataSourceImpl({required this.httpClientService});

  @override
  Future<DataState<UserLoginResponseDTO>> login({required LoginParams params}) async {

    try {

        final response = await httpClientService.post(
          path: '/auth/login',
          data: params.toJson(),
        );

        if(response.statusCode == 200){

          final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);

          final userLoginResponseDTO = UserLoginResponseDTO.fromJson(apiResponse.data!);

          final userLoginResponseEntity = userLoginResponseDTO;

          return DataSuccess(userLoginResponseEntity);

        }else{

          return DataFailed(DioException(
            message: "The server returned an empty response. This could be due to an issue with the server or a timeout. Please try again later.",
            requestOptions: RequestOptions(
              path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/auth/login',
            ),
          ));

        }

    
    } on NetworkException catch (e) {

      return DataFailed(DioException(
        message: e.message,
        requestOptions: RequestOptions(
          path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/auth/login',
        ),
      ));

    }
    
  }

  @override
  Future<DataState<UserDTO>> userMe() async {
  
    try {

        final response = await httpClientService.get(path: '/users/me');

        if(response.statusCode == 200){

          final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);

          apiResponse.data!["user"]["isOpenToday"] = apiResponse.data!["isOpenToday"] ;
          final newData = apiResponse.data!["user"];

          final userLoginResponseDTO = UserDTO.fromJson(newData);

          return DataSuccess(userLoginResponseDTO);

        }else{

          return DataFailed(DioException(
            message: "The server returned an empty response. This could be due to an issue with the server or a timeout. Please try again later.",
            requestOptions: RequestOptions(
              path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/auth/login',
            ),
          ));

        }

    
    } catch (e) {

      return DataFailed(DioException(
        message: e.toString(),
        requestOptions: RequestOptions(
          path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/auth/login',
        ),
      ));

    }

  }

  @override
  Future<DataState<CurrentTurnDto?>> getCurrentTurn() async {

    try {

      final response = await httpClientService.get(path: '/shift-day/current',);

      if(response.statusCode == 200){

        final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);

        final currentTurnDto = CurrentTurnDto.fromJson(apiResponse.data!);

        return DataSuccess(currentTurnDto);

      }else{

        return DataFailed(DioException(
          message: "The server returned an empty response. This could be due to an issue with the server or a timeout. Please try again later.",
          requestOptions: RequestOptions(
            path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/auth/login',
          ),
        ));

      }

    
    } on NetworkException catch (e) {

      return DataFailed(DioException(
        message: e.message,
        requestOptions: RequestOptions(
          path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/auth/login',
        ),
      ));

    }

  }
  
}
