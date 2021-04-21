import 'package:clean_template/core/constants/enums/http_types.dart';
import 'package:clean_template/core/init/network/interface/INetworkModel.dart';
import 'package:clean_template/product/enums/network_route.dart';

import 'interface/IResponseModel.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> send<R, T extends INetworkModel>({
    required NetworkRoute path,
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    void Function(int, int)? onReceiveProgress,
  });
}
