import 'package:clean_template/core/init/network/interface/IErrorModel.dart';

/// Response model coming from api
abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;

  IResponseModel(this.data, this.error);
}
