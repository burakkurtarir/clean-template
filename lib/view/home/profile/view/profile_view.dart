import 'package:clean_template/core/base/view/base_view.dart';
import 'package:clean_template/core/components/appbar/main_appbar.dart';
import 'package:clean_template/core/constants/navigation/navigation_constants.dart';
import 'package:clean_template/view/home/profile/viewmodel/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Build 1');
    return BaseView<ProfileViewModel>(
      onReady: (value) {
        value.setContext(context);
        value.init();
      },
      builder: (BuildContext context, value) {
        print('Build 2');
        return Scaffold(
          appBar: MainAppBar(
            title: 'Profile',
          ),
          body: Container(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    value.navigation.navigate(NavigationConstants.PROFILE_VIEW);
                  },
                  child: Text('Navigate'),
                ),
                FloatingActionButton(
                  heroTag: 'floating1',
                  onPressed: value.increase,
                  child: Icon(Icons.add),
                ),
                Observer(
                  builder: (_) => Text('${value.count}'),
                ),
                FloatingActionButton(
                  heroTag: 'floating2',
                  onPressed: value.decrease,
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ),
        );
      },
      viewModel: ProfileViewModel(),
    );
  }
}
