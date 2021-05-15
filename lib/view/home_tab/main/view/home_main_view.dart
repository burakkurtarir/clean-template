import 'package:clean_template/core/base/view/base_view.dart';
import 'package:clean_template/view/home_tab/main/viewmodel/home_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeMainView extends StatelessWidget {
  const HomeMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeMainViewModel>(
      builder: (BuildContext context, value) {
        return Observer(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Home Tab View'),
              ),
              body: value.pageList[value.currentPageIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                currentIndex: value.currentPageIndex,
                onTap: value.changePage,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'First Tab'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.star), label: 'Second Tab'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Third Tab'),
                ],
              ),
            );
          },
        );
      },
      onReady: (model) {
        model.setContext(context);
        model.init();
      },
      viewModel: HomeMainViewModel(),
    );
  }
}
