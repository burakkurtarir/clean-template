import '../../../core/constants/navigation/navigation_constants.dart';

import '../../../core/base/viewmodel/base_view_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobx/mobx.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  @override
  void init() {
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  void navigateToProfile() {
    navigation.navigate(NavigationConstants.HOME_MAIN_VIEW);
  }
}
