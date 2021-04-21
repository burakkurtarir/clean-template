import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../../product/enums/network_route.dart';
import '../../../product/extensions/network_route_extension.dart';
import '../../constants/enums/http_types.dart';
import '../../extensions/http_types_extension.dart';
import 'ICoreDio.dart';
import 'interface/INetworkModel.dart';
import 'interface/IResponseModel.dart';
import 'model/empty_model.dart';
import 'model/error_model.dart';
import 'model/response_model.dart';

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
      {required NetworkRoute path,
      required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    try {
      final response = await request(
        path.rawValue,
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
