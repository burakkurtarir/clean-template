import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  LikeButton({Key? key}) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Icon(Icons.star),
    );
  }
}
