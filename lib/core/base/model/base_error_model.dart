import '../../init/network/interface/IErrorModel.dart';

class BaseErrorModel extends IErrorModel {
  final String message;

  BaseErrorModel(this.message);
}
