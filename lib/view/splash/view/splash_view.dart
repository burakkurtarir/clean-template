import 'package:clean_template/core/base/view/base_view.dart';
import 'package:clean_template/core/components/button/my_button.dart';
import 'package:clean_template/core/extensions/context_extension.dart';
import 'package:clean_template/view/splash/viewmodel/splash_view_model.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/asset/asset_constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      builder: (BuildContext context, value) {
        // value.setContext(context);
        return Scaffold(
          backgroundColor: context.theme.splashColor,
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 8,
                child: buildSuperheroes(context),
              ),
              Expanded(
                flex: 2,
                child: buildButton(value, context),
              ),
            ],
          ),
        );
      },
      onReady: (model) {
        model.setContext(context);
        model.init();
      },
      viewModel: SplashViewModel(),
    );
  }

  Center buildButton(SplashViewModel value, BuildContext context) {
    return Center(
                child: MyButton(
                  onTap: () => value.navigateToProfile(),
                  child: Text(
                    'LET\'S GO!',
                    style: context.theme.textTheme.headline5!
                        .copyWith(color: Colors.white),
                  ),
                ),
              );
  }

  Image buildSuperheroes(BuildContext context) {
    return Image.asset(
      AssetConstants.instance.superheroLoading,
      width: context.width,
    );
  }
}
