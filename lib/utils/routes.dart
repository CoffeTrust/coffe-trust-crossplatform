import 'package:cofee_shop/views/wallet.dart';
import 'package:flutter/material.dart';
import 'package:cofee_shop/views/splash.dart';
import 'package:cofee_shop/views/homepage.dart';
import 'package:cofee_shop/views/authorization.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    Splash.routeName: (context) => const Splash(),
    Authorize.routeName: (context) => const Authorize(),
    HomePage.routeName: (context) => const HomePage(
          userAddress: "",
        ),
    WalletPage.routeName: (context) => WalletPage(
          userAddress: "",
        ),
  };
}
