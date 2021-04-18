import 'dart:io';

import 'package:clean_template/core/base/model/base_error_model.dart';
import 'package:clean_template/core/constants/enums/http_request_enum.dart';
import 'package:clean_template/core/base/model/base_model.dart';
import 'package:clean_template/core/extensions/network_extension.dart';
import 'package:clean_template/core/init/network/ICoreDio.dart';
import 'package:clean_template/core/init/network/IResponseModel.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

part './core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  @override
  final BaseOptions options;

  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<IResponseModel<R>> send<R, T extends BaseModel>(
      {required String path,
      required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    final response = await request(
      path,
      data: data,
      options: Options(method: type.rawValue),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R, T>(parseModel, data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseErrorModel('Error message'));
    }
  }
}
