import '../constants/enums/http_types.dart';

extension NetworkExtension on HttpTypes? {
  String get rawValue {
    switch (this) {
      case HttpTypes.GET:
        return 'GET';
      case HttpTypes.POST:
        return 'POST';
      default:
        throw 'ERROR HTTP TYPE';
    }
  }
}
