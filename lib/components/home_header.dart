import 'dart:async';

import 'package:cofee_shop/abi/ERC20.g.dart';
import 'package:cofee_shop/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:web3dart/web3dart.dart';

String composeAddress(String address) {
  final addressLength = address.length;
  return address[0] +
      address[1] +
      address[2] +
      address[3] +
      "..." +
      address[addressLength - 3] +
      address[addressLength - 2] +
      address[addressLength - 1];
}

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String address;
  final Web3Client ethNode;
  final ERC20 rubC;

  const Header(
      {Key? key,
      required this.address,
      required this.ethNode,
      required this.rubC})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppTheme.primaryColor,
    ));

    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      backgroundColor: AppTheme.primaryColor,
      title: Row(mainAxisSize: MainAxisSize.min, children: [
        RubBalance(
          address: address,
          rubC: rubC,
        ),
        const Spacer(),
        GFButton(
          onPressed: () async => {
            await Clipboard.setData(ClipboardData(text: address)),
          },
          text: composeAddress(address),
          shape: GFButtonShape.pills,
          color: AppTheme.whiteColor,
          textStyle: const TextStyle(
              color: AppTheme.whiteColor,
              fontSize: 18,
              fontWeight: FontWeight.w700),
          type: GFButtonType.outline,
        ),
        const Spacer(),
        SibrBalance(
          ethNode: ethNode,
          address: address,
        ),
      ]),
    );
  }
}

class RubBalance extends StatefulWidget {
  final ERC20 rubC;
  final String address;

  const RubBalance({Key? key, required this.address, required this.rubC})
      : super(key: key);

  @override
  State<RubBalance> createState() => _RubBalanceState();
}

class _RubBalanceState extends State<RubBalance> {
  String balance = "0.00";
  Timer? updateTimer;

  void fetchBalance() async {
    final String balance = await widget.rubC
        .balanceOf(
          EthereumAddress.fromHex(widget.address),
        )
        .then((value) => value / BigInt.from(10).pow(18))
        .then((value) {
      if (value > 10000) {
        return "${(value / 1000).toStringAsFixed(0)}к";
      }
      return value.toStringAsFixed(2);
    }).catchError((e) => "NaN");

    setState(() {
      this.balance = balance;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchBalance();
    updateTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      fetchBalance();
    });
  }

  @override
  void dispose() {
    updateTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "₽ $balance",
      style: const TextStyle(
          color: AppTheme.whiteColor,
          fontWeight: FontWeight.w300,
          fontSize: 18),
    );
  }
}

class SibrBalance extends StatefulWidget {
  final Web3Client ethNode;
  final String address;

  const SibrBalance({
    Key? key,
    required this.ethNode,
    required this.address,
  }) : super(key: key);

  @override
  State<SibrBalance> createState() => _SibrBalanceState();
}

class _SibrBalanceState extends State<SibrBalance> {
  String balance = "0.00";
  Timer? updateTimer;

  void fetchBalance() async {
    String result = await widget.ethNode
        .getBalance(EthereumAddress.fromHex(widget.address))
        .then((value) => value.getValueInUnit(EtherUnit.ether))
        .then((value) => value.toStringAsFixed(1))
        .catchError((e) => "NaN");

    setState(() {
      balance = result;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchBalance();
    updateTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      fetchBalance();
    });
  }

  @override
  void dispose() {
    updateTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "$balance SIBR",
      style: const TextStyle(
          color: AppTheme.whiteColor,
          fontWeight: FontWeight.w300,
          fontSize: 18),
    );
  }
}
