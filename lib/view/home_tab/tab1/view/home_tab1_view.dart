import 'package:clean_template/core/base/view/base_view.dart';
import 'package:clean_template/core/components/button/like_button.dart';
import 'package:flutter/material.dart';

class HomeTab1View extends StatelessWidget {
  const HomeTab1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (BuildContext context, value) {
        return Center(
          child: Column(
            children: [
              Text('Tab 1'),
              LikeButton(),
            ],
          ),
        );
      },
      onReady: (Object? model) {},
      viewModel: null,
    );
  }
}
