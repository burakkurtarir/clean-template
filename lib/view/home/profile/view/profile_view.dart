import 'package:clean_template/core/base/view/base_view.dart';
import 'package:clean_template/core/init/network/network_manager.dart';
import 'package:clean_template/view/home/profile/service/profile_service.dart';
import 'package:clean_template/view/home/profile/viewmodel/profile_view_model.dart';
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
            title: Text('Profile'),
            actions: [
              IconButton(
                icon: Icon(Icons.get_app),
                onPressed: () {
                  value.fetchTodos();
                },
              ),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  value.clearTodos();
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
              value.changeThemeRandomly();
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
        print('Observer working');
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
