import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_app_prv/shared/constants/app_values.dart';
import 'package:weather_app_prv/shared/utils/utils.dart';

class DioManager {
  Dio? _dioInstance;

  Dio? get dio {
    _dioInstance ??= initDio();
    return _dioInstance;
  }

  Dio initDio() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppValues.baseUrl,
        headers: <String, String> {},
        sendTimeout: 30000,
        connectTimeout: 20000,
        receiveTimeout: 60000,
      ),
    );
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 120,
        ),
      );
    }
    return dio;
  }

  void update() => _dioInstance = initDio();

  /// DIO GET
  /// take [url], concrete route
  Future<Response> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? json,
  }) async {
    return await dio!.get(
      url,
      queryParameters: json,
      options: Options(headers: headers),
    ).then((response) {
      return response;
    }).catchError((error) {
      errorToast(
        code: error.response?.statusCode?.toString() ?? '',
        message: error.response?.data?.toString() ?? '',
      );
    });
  }

  /// DIO POST
  /// take [url], concrete route
  Future<Response> post(
    String url, {
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    return await dio!.post(
      url,
      data: body,
      options: Options(headers: headers),
    ).then((response) {
      return response;
    }).catchError((error) {
      errorToast(
        code: error.response?.statusCode?.toString() ?? '',
        message: error.response?.data?.toString() ?? '',
      );
    });
  }

  /// DIO PUT
  /// take [url], concrete route
  Future<Response> put(
    String url, {
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    return await dio!.put(
      url,
      data: body,
      options: Options(headers: headers),
    ).then((response) {
      return response;
    }).catchError((error) {
      errorToast(
        code: error.response?.statusCode?.toString() ?? '',
        message: error.response?.data?.toString() ?? '',
      );
    });
  }

  /// DIO DELETE
  /// take [url], concrete route
  Future<Response> delete(
    String url, {
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    return await dio!.delete(
      url,
      data: body,
      options: Options(headers: headers),
    ).then((response) {
      return response;
    }).catchError((error) {
      errorToast(
        code: error.response?.statusCode?.toString() ?? '',
        message: error.response?.data?.toString() ?? '',
      );
    });
  }
}
