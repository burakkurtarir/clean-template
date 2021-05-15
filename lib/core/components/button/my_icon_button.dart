import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  const MyIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
    );
  }
}
