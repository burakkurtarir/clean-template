import 'package:clean_template/core/base/model/base_model.dart';
import 'package:clean_template/core/constants/enums/http_request_enum.dart';
import 'package:clean_template/core/init/network/IResponseModel.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> send<R, T extends BaseModel>({
    required String path,
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, Object>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  });
}
