part of './core_dio.dart';

extension _CoreDioOperations on CoreDio {
  R? _responseParser<R, T extends INetworkModel>(
      dynamic responseBody, T parseModel) {
    if (responseBody is List) {
      return responseBody.map((e) => parseModel.fromJson(e)).toList().cast<T>()
          as R;
    } else if (responseBody is Map) {
      return parseModel.fromJson(responseBody as Map<String, Object?>) as R;
    } else {
      return EmptyModel(name: responseBody.toString()) as R;
    }
  }
}
