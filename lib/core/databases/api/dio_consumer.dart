import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/core/databases/api/end_points.dart';

import '../../errors/exceptions.dart';
import 'api_consumer.abstract.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baserUrl;
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('REQUEST[${options.method}] => PATH: ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print(
            'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        print(
            'ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
        return handler.next(e);
      },
    ));
  }
  @override
  Future delete(String path, {data, Map<String, dynamic>? queryParameters}) {
    try {
      return dio.delete(path, data: data, queryParameters: queryParameters);
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }

  @override
  Future get(String path, {data, Map<String, dynamic>? queryParameters}) {
    try {
      return dio.get(path, data: data, queryParameters: queryParameters);
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }

  @override
  Future post(String path,
      {data, Map<String, dynamic>? queryParameters, bool isFormData = false}) {
    try {
      return dio.post(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }

  @override
  Future put(String path,
      {data, Map<String, dynamic>? queryParameters, bool isFormData = false}) {
    try {
      return dio.patch(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }
}
