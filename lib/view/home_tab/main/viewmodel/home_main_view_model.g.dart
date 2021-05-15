// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_main_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeMainViewModel on _HomeMainViewModelBase, Store {
  final _$currentPageIndexAtom =
      Atom(name: '_HomeMainViewModelBase.currentPageIndex');

  @override
  int get currentPageIndex {
    _$currentPageIndexAtom.reportRead();
    return super.currentPageIndex;
  }

  @override
  set currentPageIndex(int value) {
    _$currentPageIndexAtom.reportWrite(value, super.currentPageIndex, () {
      super.currentPageIndex = value;
    });
  }

  final _$_HomeMainViewModelBaseActionController =
      ActionController(name: '_HomeMainViewModelBase');

  @override
  void changePage(int index) {
    final _$actionInfo = _$_HomeMainViewModelBaseActionController.startAction(
        name: '_HomeMainViewModelBase.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$_HomeMainViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPageIndex: ${currentPageIndex}
    ''';
  }
}
