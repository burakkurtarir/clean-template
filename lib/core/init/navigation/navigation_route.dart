import 'package:clean_template/core/components/not_found/not_found_navigation_widget.dart';
import 'package:clean_template/core/constants/navigation/navigation_constants.dart';
import 'package:clean_template/view/home/profile/view/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.PROFILE_VIEW:
        return normalNavigate(ProfileView());
      default:
        return normalNavigate(NavigationNotFoundWidget());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
