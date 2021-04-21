import 'package:clean_template/core/init/navigation/navigation_route.dart';
import 'package:clean_template/core/init/navigation/navigation_service.dart';
import 'package:clean_template/core/init/notifier/theme_notifier.dart';
import 'package:clean_template/view/home/profile/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/init/notifier/application_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ...ApplicationProvider.instance.dependItems,
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Template',
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      debugShowCheckedModeBanner: false,
      home: ProfileView(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
