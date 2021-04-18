import 'package:clean_template/core/init/network/IResponseModel.dart';

class BaseErrorModel extends IErrorModel {
  final String message;

  BaseErrorModel(this.message);
}
