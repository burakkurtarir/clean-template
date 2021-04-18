abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;
}

abstract class IErrorModel<T> {}

class ResponseModel<T> extends IResponseModel<T> {
  @override
  final T? data;

  @override
  final IErrorModel? error;

  ResponseModel({
    this.data,
    this.error,
  });
}
