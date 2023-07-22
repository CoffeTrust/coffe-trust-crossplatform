import 'package:cofee_shop/views/homepage.dart';
import 'package:cofee_shop/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cofee_shop/utils/routes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      initialRoute: Splash.routeName,
      routes: AppRoutes.routes,
      onGenerateRoute: (settings) {
        if (settings.name == HomePage.routeName) {
          final args = settings.arguments as String;

          return MaterialPageRoute(
            builder: (context) {
              return HomePage(userAddress: args);
            },
          );
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
