import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) builder;
  final T viewModel;
  final Function(T model)? onReady;
  final VoidCallback? onDispose;

  BaseView({
    Key? key,
    required this.builder,
    required this.viewModel,
    this.onReady,
    this.onDispose,
  }) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T> extends State<BaseView<T>> {
  late T viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.viewModel;
    if (widget.onReady != null) widget.onReady!(viewModel);
  }

  @override
  void dispose() {
    if (widget.onDispose != null) widget.onDispose!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, viewModel);
  }
}
