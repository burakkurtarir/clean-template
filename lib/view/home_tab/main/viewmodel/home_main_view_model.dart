import 'package:clean_template/core/base/viewmodel/base_view_model.dart';
import 'package:clean_template/view/home_tab/tab1/view/home_tab1_view.dart';
import 'package:clean_template/view/home_tab/tab2/view/home_tab2_view.dart';
import 'package:clean_template/view/home_tab/tab3/view/home_tab3_view.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobx/mobx.dart';

part 'home_main_view_model.g.dart';

class HomeMainViewModel = _HomeMainViewModelBase with _$HomeMainViewModel;

abstract class _HomeMainViewModelBase with Store, BaseViewModel {
  List<Widget> pageList = [HomeTab1View(), HomeTab2View(), HomeTab3View()];

  @observable
  int currentPageIndex = 0;

  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @action
  void changePage(int index) {
    currentPageIndex = index;
  }
}
