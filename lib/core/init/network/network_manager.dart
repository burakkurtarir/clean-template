import 'package:clean_template/core/init/network/ICoreDio.dart';
import 'package:clean_template/core/init/network/core_dio.dart';
import 'package:dio/dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDio? coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
    );

    coreDio = CoreDio(baseOptions);
  }
}
