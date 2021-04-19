import 'package:clean_template/core/base/viewmodel/base_view_model.dart';
import 'package:clean_template/core/constants/enums/http_request_enum.dart';
import 'package:clean_template/view/home/profile/model/todo_model.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
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
  void init() {
    fetchTodos();
  }

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

  Future<void> fetchTodos() async {
    // final response = await coreDio!.send<List<TodoModel>, TodoModel>(
    //   path: 'todos',
    //   type: HttpTypes.GET,
    //   parseModel: TodoModel(),
    // );
    // print(response.data!.length);
    // if (response.data is List<TodoModel>) {
    //   print('Success');
    //   print(response.data!.length);
    // } else {
    //   print('Error');
    //   print(response.error);
    // }
    final baseOptions = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      method: 'GET',
    );
    final dio = Dio(baseOptions);
    dio.interceptors.add(InterceptorsWrapper(onError: (d, e) {
      print('Boom');
    }));
    // dio.httpClientAdapter = DefaultHttpClientAdapter();
    final response = await dio.request('todoss');
    print('Done');
    if (response.statusCode == 404) {
      print('404 yedik');
      return;
    }

    final data = response.data;
    if (data is List) {
      print('list');
      final myData = data.map((e) => TodoModel().fromJson(e)).toList();
      print(myData[0].title);
    } else if (response.data is Map) {
      print('Map');
    } else {
      print('Error');
    }
  }
}
