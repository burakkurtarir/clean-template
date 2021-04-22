import '../interface/IErrorModel.dart';
import '../interface/INetworkModel.dart';

class ErrorModel<T> implements IErrorModel {
  @override
  String? description;

  @override
  INetworkModel? model;

  @override
  int? statusCode;

  ErrorModel({this.description, this.model, this.statusCode});
}
