import 'package:clean_template/core/init/cache/locale_manager.dart';

import '../../init/network/ICoreDio.dart';
import '../../init/network/network_manager.dart';
import 'package:flutter/cupertino.dart';
import '../../init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  BuildContext? context;
  NavigationService navigation = NavigationService.instance;
  ICoreDio? coreDio = NetworkManager.instance!.coreDio;
  LocaleManager localeManager = LocaleManager.instance;

  void setContext(BuildContext context);
  void init();
}
