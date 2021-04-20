import 'package:clean_template/core/constants/enums/http_request_enum.dart';
import 'package:clean_template/core/init/network/interface/INetworkModel.dart';

import 'interface/IResponseModel.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> send<R, T extends INetworkModel>({
    required String path,
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, Object>? queryParameters,
    Map<String, dynamic>? headers,
    void Function(int, int)? onReceiveProgress,
  });
}
