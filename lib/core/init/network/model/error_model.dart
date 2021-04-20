import 'package:clean_template/core/init/network/interface/IErrorModel.dart';
import 'package:clean_template/core/init/network/interface/INetworkModel.dart';

class ErrorModel<T> implements IErrorModel {
  @override
  String? description;

  @override
  INetworkModel? model;

  @override
  int? statusCode;

  ErrorModel({this.description, this.model, this.statusCode});
}
