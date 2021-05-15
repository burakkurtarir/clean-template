import '../../extensions/string_extension.dart';

class AssetConstants {
  static AssetConstants? _instance;
  static AssetConstants get instance => _instance ??= AssetConstants._init();

  AssetConstants._init();

  String get superheroLoading => 'superhero_loading'.gif;
}
