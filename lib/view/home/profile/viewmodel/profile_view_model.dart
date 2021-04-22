import 'package:flutter/src/widgets/framework.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import '../model/todo_model.dart';
import '../service/IProfileService.dart';

part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with BaseViewModel, Store {
  IProfileService profileService;

  _ProfileViewModelBase(this.profileService) {
    fetchTodos();
  }

  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  void navigateToExplore() {
    navigation.navigate(NavigationConstants.EXPLORE_VIEW);
  }

  void toggleTheme() {
    Provider.of<ThemeNotifier>(context!, listen: false).toggleTheme();
  }

  @observable
  ObservableList<TodoModel> todoList = ObservableList();

  @observable
  bool isLoading = false;

  @action
  Future<void> clearTodos() async {
    todoState = TodoClearingState();
    await Future.delayed(Duration(seconds: 1));
    todoList.clear();
    todoState = TodoInitialState();
  }

  @observable
  TodoState? todoState;

  @action
  Future<void> fetchTodos() async {
    todoState = TodoLoadingState();
    final response = await profileService.fetchTodos();
    if (response != null) {
      todoList = response.asObservable();
      todoState = TodoDoneState(response);
    } else {
      todoState = TodoErrorState('Bir hata oluştu');
    }
  }
}

abstract class TodoState {}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoClearingState extends TodoState {}

class TodoDoneState extends TodoState {
  final List<TodoModel>? todoList;

  TodoDoneState(this.todoList);
}

class TodoErrorState extends TodoState {
  final String? errorMessage;

  TodoErrorState(this.errorMessage);
}
