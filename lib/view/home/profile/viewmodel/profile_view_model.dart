import 'package:clean_template/core/base/viewmodel/base_view_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobx/mobx.dart';

// class ProfileViewModel with BaseViewModel {
//   String name = 'Burak';

//   @override
//   void init() {}

//   @override
//   void setContext(BuildContext context) {
//     this.context = context;
//   }
// }
//
part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with BaseViewModel, Store {
  @observable
  int count = 0;

  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @action
  void increase() {
    count++;
  }

  @action
  void decrease() {
    count--;
  }
  // String name = 'Burak';

  // @override
  // void init() {}

  // @override
  // void setContext(BuildContext context) {
  //   this.context = context;
  // }
}
