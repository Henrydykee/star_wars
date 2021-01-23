import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:star_wars/utils/router.gr.dart';
import 'package:star_wars/views/home.dart';

import 'locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.homePage,
      navigatorKey: locator<NavigationService>().navigatorKey,
      home: HomePage(),
    );
  }
}

