import 'dart:io';

import 'package:clean_template/core/constants/enums/http_request_enum.dart';
import 'package:clean_template/core/extensions/network_extension.dart';
import 'package:clean_template/core/init/network/ICoreDio.dart';
import 'package:clean_template/core/init/network/interface/INetworkModel.dart';
import 'package:clean_template/core/init/network/interface/IResponseModel.dart';
import 'package:clean_template/core/init/network/model/empty_model.dart';
import 'package:clean_template/core/init/network/model/error_model.dart';
import 'package:clean_template/core/init/network/model/response_model.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

part './core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  @override
  final BaseOptions options;

  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper(onError: (error, handler) {
      // print(error.message);
      handler.next(error);
    }));
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<IResponseModel<R>> send<R, T extends INetworkModel>(
      {required String path,
      required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      Map<String, dynamic>? headers,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    try {
      final response = await request(
        path,
        data: data,
        options: Options(method: type.rawValue, headers: headers),
      );
      switch (response.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.accepted:
          final model = _responseParser<R, T>(response.data, parseModel);
          return ResponseModel<R>(data: model);
        default:
          return ResponseModel(
            error: ErrorModel(
              description: 'There is an error',
              statusCode: 404,
            ),
          );
      }
    } on DioError catch (e) {
      return ResponseModel(
        error: ErrorModel(
          description: e.message,
          statusCode: e.response!.statusCode,
        ),
      );
    }
  }
}
