import 'package:clean_template/core/base/view/base_view.dart';
import 'package:clean_template/core/components/appbar/main_appbar.dart';
import 'package:clean_template/core/constants/navigation/navigation_constants.dart';
import 'package:clean_template/view/home/profile/viewmodel/profile_view_model.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      onReady: (value) {
        value.setContext(context);
        value.init();
      },
      builder: (BuildContext context, value) {
        return Scaffold(
          appBar: MainAppBar(
            title: 'Profile',
          ),
          body: Container(
            child: TextButton(
              onPressed: () {
                value.navigation.navigate(NavigationConstants.PROFILE_VIEW);
              },
              child: Text('Navigate'),
            ),
          ),
        );
      },
      viewModel: ProfileViewModel(),
    );
  }
}
