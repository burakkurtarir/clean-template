import 'ICoreDio.dart';
import 'core_dio.dart';
import 'package:dio/dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  late ICoreDio coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
    );

    coreDio = CoreDio(baseOptions);
  }
}
