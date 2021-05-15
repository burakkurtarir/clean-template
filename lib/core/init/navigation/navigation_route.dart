import 'package:clean_template/view/home_tab/main/view/home_main_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../view/home/explore/view/explore_view.dart';
import '../../../view/home/profile/view/profile_view.dart';
import '../../components/not_found/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.PROFILE_VIEW:
        return normalNavigate(ProfileView());
      case NavigationConstants.EXPLORE_VIEW:
        return normalNavigate(ExploreView());
      case NavigationConstants.HOME_MAIN_VIEW:
        return normalNavigate(HomeMainView());
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
