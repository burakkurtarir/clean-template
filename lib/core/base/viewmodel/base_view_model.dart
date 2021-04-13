import 'package:clean_template/core/init/navigation/navigation_service.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseViewModel {
  late BuildContext context;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
}
