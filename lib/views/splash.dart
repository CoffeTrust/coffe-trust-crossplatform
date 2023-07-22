import 'package:flutter/material.dart';

import 'package:cofee_shop/utils.dart';
import 'package:cofee_shop/views/homepage.dart';
import 'package:cofee_shop/views/authorization.dart';
import 'package:cofee_shop/views/loading.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'dart:io';

import 'package:web3dart/web3dart.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  static const routeName = '/splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    checkPk();
  }

  Future<void> checkPk() async {
    final _has = await hasPk();

    if (_has) {
      await authorize();
    } else {
      navigateToAuthorization();
    }
  }

  Future<void> authorize() async {
    String? pk = await getPk(auth);

    if (pk != null && pk != "") {
      navigateToHome(EthPrivateKey.fromHex(pk).address.hex);
    }

    if (pk == "") {
      SystemNavigator.pop();
      exit(0);
    }
  }

  void navigateToHome(String userAddress) {
    Navigator.pushReplacementNamed(context, HomePage.routeName,
        arguments: userAddress);
  }

  void navigateToAuthorization() {
    Navigator.pushReplacementNamed(
      context,
      Authorize.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Loading();
  }
}
