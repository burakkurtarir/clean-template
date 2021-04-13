import 'package:clean_template/core/init/navigation/INavigationService.dart';
import 'package:flutter/cupertino.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;
  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Future<void> navigate(String path, {Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateAndClear(String path, {Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(
      path,
      (route) => false,
      arguments: data,
    );
  }
}
