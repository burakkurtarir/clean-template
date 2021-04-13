import 'package:clean_template/core/base/viewmodel/base_view_model.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileViewModel with BaseViewModel {
  String name = 'Burak';

  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }
}
