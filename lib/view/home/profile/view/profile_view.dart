import 'package:clean_template/core/init/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/init/network/network_manager.dart';
import '../service/profile_service.dart';
import '../viewmodel/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
          appBar: AppBar(
            title: Text(LocaleKeys.home_profile_title.tr()),
            actions: [
              IconButton(
                icon: Icon(Icons.get_app),
                onPressed: () {
                  value.fetchTodos();
                },
              ),
              IconButton(
                icon: Icon(
                  Provider.of<ThemeNotifier>(context).isDark
                      ? Icons.brightness_7
                      : Icons.brightness_1,
                ),
                onPressed: () {
                  value.toggleTheme();
                },
              ),
              IconButton(
                icon: Icon(Icons.navigate_next),
                onPressed: () {
                  value.navigateToExplore();
                },
              ),
            ],
          ),
          body: buildListView(value),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              value.toggleTheme();
            },
            child: Icon(Icons.update),
          ),
        );
      },
      viewModel: ProfileViewModel(
        ProfileService(coreDio: NetworkManager.instance!.coreDio),
      ),
    );
  }

  Observer buildListView(ProfileViewModel value) {
    return Observer(
      builder: (BuildContext context) {
        final todoState = value.todoState!;
        if (todoState is TodoLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (todoState is TodoDoneState) {
          return ListView.builder(
            itemCount: value.todoList.length,
            itemBuilder: (c, i) {
              final data = value.todoList[i];
              return ListTile(
                title: Text('${data.title}'),
              );
            },
          );
        } else if (todoState is TodoErrorState) {
          return Center(child: Text(todoState.errorMessage!));
        } else if (todoState is TodoClearingState) {
          return Center(child: Text('Temizleniyor'));
        } else {
          return Container();
        }
      },
    );
  }
}
