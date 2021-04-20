// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  final _$todoListAtom = Atom(name: '_ProfileViewModelBase.todoList');

  @override
  ObservableList<TodoModel> get todoList {
    _$todoListAtom.reportRead();
    return super.todoList;
  }

  @override
  set todoList(ObservableList<TodoModel> value) {
    _$todoListAtom.reportWrite(value, super.todoList, () {
      super.todoList = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ProfileViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$todoStateAtom = Atom(name: '_ProfileViewModelBase.todoState');

  @override
  TodoState? get todoState {
    _$todoStateAtom.reportRead();
    return super.todoState;
  }

  @override
  set todoState(TodoState? value) {
    _$todoStateAtom.reportWrite(value, super.todoState, () {
      super.todoState = value;
    });
  }

  final _$clearTodosAsyncAction =
      AsyncAction('_ProfileViewModelBase.clearTodos');

  @override
  Future<void> clearTodos() {
    return _$clearTodosAsyncAction.run(() => super.clearTodos());
  }

  final _$fetchTodosAsyncAction =
      AsyncAction('_ProfileViewModelBase.fetchTodos');

  @override
  Future<void> fetchTodos() {
    return _$fetchTodosAsyncAction.run(() => super.fetchTodos());
  }

  @override
  String toString() {
    return '''
todoList: ${todoList},
isLoading: ${isLoading},
todoState: ${todoState}
    ''';
  }
}
