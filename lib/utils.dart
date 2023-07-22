import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'dart:math';

const String key = "pk522s2sssdasdssrs3";

Future<bool> hasPk() async {
  return await FlutterKeychain.get(key: key) != null;
}

Future<String?> getPk(LocalAuthentication auth) async {
  String? pk = await FlutterKeychain.get(key: key);
  if (pk != null) {
    try {
      if (await auth.authenticate(
        localizedReason: 'Подтвердите доступ к кошельку',
        options: const AuthenticationOptions(),
      )) {
        return pk;
      }
      return "";
    } on PlatformException catch (_) {
      return null;
    }
  }
  return null;
}

Future<bool> setPk(
    {required LocalAuthentication auth, required String secret}) async {
  try {
    if (await auth.authenticate(
      localizedReason: 'Подтвердите доступ к кошельку',
      options: const AuthenticationOptions(
        stickyAuth: true,
      ),
    )) {
      await FlutterKeychain.put(key: key, value: secret);
      return true;
    }
    return false;
  } on PlatformException catch (_) {
    return false;
  }
}

Future<String> createWallet({required LocalAuthentication auth}) async {
  await auth.authenticate(
    localizedReason: 'Подтвердите доступ к кошельку',
    options: const AuthenticationOptions(
      stickyAuth: true,
    ),
  );

  var credentials = EthPrivateKey.createRandom(Random.secure());
  await FlutterKeychain.put(
      key: key, value: bytesToHex(credentials.privateKey));
  return credentials.address.hex;
}

Widget svg({required String path}) => ScalableImageWidget.fromSISource(
    si: ScalableImageSource.fromSvg(rootBundle, path));
