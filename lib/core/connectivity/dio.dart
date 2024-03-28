import 'dart:convert';

import 'package:coolmovies/core/connectivity/utils.dart';
import 'package:coolmovies/core/logger.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

abstract class DioService {
  Future dioGet({required String endpoint, bool withToken = true, Map<String, String>? params});
  dioPost({required String endpoint, required Map body});
  dioPut({required String endpoint, required Map body, String? token});
  dioDelete({required String endpoint, required Map body});
  dioPatch({required String endpoint, required Map body, String? token});
}

class DioClient implements DioService {
  final Dio _dio;

  DioClient(this._dio);

  void _printLoggSuccess(Response response) =>
      Logg.consoleShow("ENDPOINT :: ${response.requestOptions.path} \nVERB :: ${response.requestOptions.method}");

  @override
  Future<Result<dynamic, dynamic>> dioGet(
      {required String endpoint, bool withToken = true, Map<String, String>? params, String? token}) async {
    dynamic errorMessage;
    try {
      Response response = await _dio.get(
        RequestUtils.pathDio(endpoint),
        queryParameters: params,
        options: RequestUtils.headerRequestDio(),
      );
      _printLoggSuccess(response);
      return Success(response.data);
    } on DioException catch (e) {
      errorMessage = ErrorTretment.getError(e);
    }
    return Failure(errorMessage);
  }

  @override
  Future<Result<dynamic, dynamic>> dioPost({required String endpoint, required Map body, String? token}) async {
    dynamic errorMessage;
    try {
      var newBody = json.encode([body]);

      Response response = await _dio.post(RequestUtils.pathDio(endpoint),
          data: newBody, options: RequestUtils.headerRequestDio());
      _printLoggSuccess(response);
      return Success(response.data);
    } on DioException catch (e) {
      errorMessage = ErrorTretment.getError(e);
    }
    return Failure(errorMessage);
  }

  @override
  Future<Result<dynamic, dynamic>> dioDelete({required String endpoint, Map? body, String? token}) async {
    dynamic errorMessage;

    try {
       var newBody = json.encode(body);
      Response response = await _dio.delete(RequestUtils.pathDio(endpoint),
          data: newBody, options: RequestUtils.headerRequestDio());
      _printLoggSuccess(response);
      return Success(response.data);
    } on DioException catch (e) {
      errorMessage = ErrorTretment.getError(e);
    }
    return Failure(errorMessage);
  }

  @override
  Future<Result<dynamic, dynamic>> dioPut({required String endpoint, required Map body, String? token}) async {
    dynamic errorMessage;

    try {
       var newBody = json.encode(body);
      Response response = await _dio.put(RequestUtils.pathDio(endpoint),
          data: newBody, options: RequestUtils.headerRequestDio());
      _printLoggSuccess(response);
      return Success(response.data);
    } on DioException catch (e) {
      errorMessage = ErrorTretment.getError(e);
    }
    return Failure(errorMessage);
  }

  @override
  Future<Result<dynamic, dynamic>> dioPatch({required String endpoint, required Map body, String? token}) async {
    dynamic errorMessage;

    try {
       var newBody = json.encode([body]);
      Response response = await _dio.patch(RequestUtils.pathDio(endpoint),
          data: newBody, options: RequestUtils.headerRequestDio());
      _printLoggSuccess(response);
      return Success(response.data);
    } on DioException catch (e) {
      errorMessage = ErrorTretment.getError(e);
    }
    return Failure(errorMessage);
  }
}

class ErrorTretment {
  static String getError(DioException e) {
    String errorMessage = "Some error here";

    //apply here errro treatment

    _printLoggError(e, errorMessage);
    return errorMessage;
  }

  static void _printLoggError(DioException e, String errorMessage) => Logg.error(
      "ENDPOINT :: ${e.requestOptions.path} \nVERB :: ${e.requestOptions.method}  \nSTATUS CODE :: ${e.response?.statusCode}  \nErrorMessage :: $errorMessage");
}
