import 'package:clean_template/core/init/network/ICoreDio.dart';
import 'package:clean_template/core/init/network/network_manager.dart';
import 'package:flutter/cupertino.dart';
import '../../init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  BuildContext? context;
  NavigationService navigation = NavigationService.instance;
  ICoreDio? coreDio = NetworkManager.instance!.coreDio;

  void setContext(BuildContext context);
  void init();
}
