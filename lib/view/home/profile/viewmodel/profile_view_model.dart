import 'package:clean_template/core/init/network/interface/IResponseModel.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/constants/enums/http_request_enum.dart';
import '../../../../core/init/network/model/error_model.dart';
import '../model/todo_model.dart';

part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with BaseViewModel, Store {
  @override
  void init() {
    fetchTodos();
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
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
    final response = await coreDio!.send<List<TodoModel>, TodoModel>(
      path: 'todoss',
      type: HttpTypes.GET,
      parseModel: TodoModel(),
    );
    if (response.data is List<TodoModel>) {
      print('Success');
      todoState = TodoDoneState(response.data);
    } else {
      print('Error');
      todoState = TodoErrorState(response.error!.description);
    }
    // final baseOptions = BaseOptions(
    //   baseUrl: 'https://jsonplaceholder.typicode.com/',
    //   method: 'GET',
    // );
    // final dio = Dio(baseOptions);
    // dio.interceptors.add(InterceptorsWrapper(onError: (d, e) {
    //   print('Boom');
    //   print(d.message);
    // }));
    // // dio.httpClientAdapter = DefaultHttpClientAdapter();
    // final response = await dio.request('todos/2');

    // if (response.data is List) {
    //   print('list');
    //   final myData = response.data.map((e) => TodoModel().fromJson(e)).toList();
    //   print(myData[0].title);
    // } else if (response.data is Map) {
    //   final myData = TodoModel().fromJson(response.data);
    //   print(myData.title);
    // } else {
    //   print('Error');
    // }
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
