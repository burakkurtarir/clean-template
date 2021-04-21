import 'package:clean_template/product/enums/network_route.dart';
import 'package:clean_template/product/exception/network_route_exception.dart';

extension NetworkRouteExtension on NetworkRoute {
  String get rawValue {
    switch (this) {
      case NetworkRoute.BASEURL:
        return 'https://jsonplaceholder.typicode.com/';
      case NetworkRoute.TODOS:
        return 'todos';
      default:
        throw NetworkRouteException();
    }
  }
}
