import 'INetworkModel.dart';

/// Error model coming from api if there is an error
abstract class IErrorModel<T> {
  int? statusCode;
  String? description;
  INetworkModel? model;
}
