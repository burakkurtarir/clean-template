import '../../constants/enums/http_types.dart';
import 'interface/INetworkModel.dart';
import '../../../product/enums/network_route.dart';

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
