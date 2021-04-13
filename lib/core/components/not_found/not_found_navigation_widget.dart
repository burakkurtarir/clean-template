import 'package:flutter/material.dart';

class NavigationNotFoundWidget extends StatelessWidget {
  const NavigationNotFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Found'),
      ),
      body: Container(
        child: Center(
          child: Text('Navigation Not Found'),
        ),
      ),
    );
  }
}
