import 'package:cofee_shop/abi/CoffeeShop.g.dart';
import 'package:cofee_shop/abi/ERC20.g.dart';
import 'package:cofee_shop/theme.dart';
import 'package:cofee_shop/utils.dart';
import 'package:cofee_shop/views/homepage.dart';
import 'package:cofee_shop/views/product_details.dart';
import 'package:cofee_shop/views/wallet.dart';
import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:web3dart/web3dart.dart';

Future<void> transfer(BigInt id, String recipient, CoffeeShop shop) async {
  final auth = LocalAuthentication();

  var pk = await getPk(auth);

  if (pk == null) {
    throw Exception("Нет доступа к приватному ключу");
  }

  final creds = EthPrivateKey.fromHex(pk);

  await shop
      .transfer(EthereumAddress.fromHex(recipient), id, credentials: creds)
      .then((hash) => txWait(hash, shop.client));
}

class TransferScreen extends StatefulWidget {
  final UserCoffee userCoffee;
  final String userAddress;
  final ERC20 rubC;
  final CoffeeShop shop;
  const TransferScreen(
      {Key? key,
      required this.userCoffee,
      required this.userAddress,
      required this.rubC,
      required this.shop})
      : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  bool transferStarted = false;
  Exception? error;
  String recipientAddress = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        address: widget.userAddress,
        rubC: widget.rubC,
        ethNode: widget.shop.client,
        body: ListView(children: [
          Container(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: const Text("Передать кофе",
                      style: TextStyle(
                          color: Color.fromARGB(255, 65, 20, 0),
                          fontWeight: FontWeight.w700,
                          fontSize: 22)),
                ),
                Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: AppTheme.primaryColor),
                    child: ScalableImageWidget(si: widget.userCoffee.image)),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(children: [
                    Text(widget.userCoffee.sizeName,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 65, 20, 0),
                            fontWeight: FontWeight.w700,
                            fontSize: 22)),
                    Text(widget.userCoffee.baseName,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 65, 20, 0),
                            fontWeight: FontWeight.w700,
                            fontSize: 22)),
                  ]),
                ),
                Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextField(
                          onChanged: (addr) {
                            setState(() {
                              recipientAddress = addr;
                            });
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Адрес получателя',
                          ),
                        )),
                    transferStarted
                        ? const Center(
                            child: Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: CircularProgressIndicator()))
                        : ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppTheme.primaryColor)),
                            onPressed: () {
                              try {
                                EthereumAddress.fromHex(recipientAddress);
                              } catch (_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Неверный адрес')),
                                );
                                return;
                              }

                              transfer(widget.userCoffee.tokenId,
                                      recipientAddress, widget.shop)
                                  .then((value) async {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Кофе отправлен')),
                                );

                                await Future.delayed(
                                        const Duration(seconds: 2), () {})
                                    .then((value) => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => WalletPage(
                                                userAddress:
                                                    widget.userAddress))));
                              }).catchError((e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("Ошибка ${e.toString()}")));
                              });

                              transferStarted = true;
                            },
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text("Отправить",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18))),
                          ),
                  ],
                ),
              ]))
        ]));
  }
}
