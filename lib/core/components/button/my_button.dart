import 'package:clean_template/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  MyButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton>
    with SingleTickerProviderStateMixin<MyButton> {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: context.lowDuration,
    );
    animation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(parent: animationController, curve: Curves.ease),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (d) => animationController.forward(),
      onTapUp: (d) => animationController.reverse(),
      onTapCancel: () => animationController.reverse(),
      onTap: widget.onTap,
      child: ScaleTransition(
        scale: animation,
        child: widget.child,
      ),
    );
  }
}
