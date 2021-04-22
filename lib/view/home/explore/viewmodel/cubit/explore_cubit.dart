import '../../../../../core/base/viewmodel/base_view_model.dart';
import '../../model/todo_model.dart';
import '../../service/IExploreService.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreCubit extends Cubit<ExploreState> with BaseViewModel {
  final IExploreService exploreService;

  ExploreCubit(this.exploreService) : super(ExploreInitialState()) {
    fetchTodos();
  }

  late List<TodoModel> todoList;

  Future<void> fetchTodos() async {
    emit(ExploreLoadingState());
    final response = await exploreService.fetchTodos();
    if (response!.isEmpty) {
      emit(ExploreErrorState());
    } else {
      emit(ExploreCompletedState(todoList: response));
    }
    todoList = response;
  }

  @override
  void init() {}

  @override
  void setContext(BuildContext context) {}
}

abstract class ExploreState {}

class ExploreInitialState extends ExploreState {}

class ExploreLoadingState extends ExploreState {}

class ExploreCompletedState extends ExploreState {
  final List<TodoModel> todoList;

  ExploreCompletedState({required this.todoList});
}

class ExploreErrorState extends ExploreState {}
