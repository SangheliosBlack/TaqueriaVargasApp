import 'package:taqueria_vargas/core/resources/pagination_dto.dart';

class ApiResponse<T> {
  final String status;
  final String message;
  final T? data;
  final Meta? meta;

  ApiResponse({
    required this.status,
    required this.message,
    this.data,
    this.meta,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(dynamic json)? fromData,
  }) {
    return ApiResponse<T>(
      status: json['status']?.toString() ?? 'UNKNOWN',
      message: json['message']?.toString() ?? '',
      data: fromData != null && json['data'] != null
          ? fromData(json['data'])
          : json['data'] as T?,
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
    );
  }
}
