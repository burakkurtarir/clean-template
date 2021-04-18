// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  final _$countAtom = Atom(name: '_ProfileViewModelBase.count');

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  final _$_ProfileViewModelBaseActionController =
      ActionController(name: '_ProfileViewModelBase');

  @override
  void increase() {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.increase');
    try {
      return super.increase();
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrease() {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.decrease');
    try {
      return super.decrease();
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count: ${count}
    ''';
  }
}
