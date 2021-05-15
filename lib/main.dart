import 'package:clean_template/core/constants/app/application_constants.dart';
import 'package:clean_template/core/init/cache/locale_manager.dart';
import 'package:clean_template/core/init/lang/language_manager.dart';
import 'package:clean_template/view/splash/view/splash_view.dart';
import 'package:easy_localization/easy_localization.dart';

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/init/notifier/application_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.prefrencesInit();

  await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ...ApplicationProvider.instance.dependItems,
      ],
      child: EasyLocalization(
        path: ApplicationConstants.LANG_ASSET_PATH,
        supportedLocales: LanguageManager.instance!.supportedLocales,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Template',
      theme: Provider.of<ThemeNotifier>(context, listen: true).currentTheme,
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
