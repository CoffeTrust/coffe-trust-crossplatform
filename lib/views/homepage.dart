import 'dart:convert';

import 'package:cofee_shop/abi/CoffeeShop.g.dart';
import 'package:cofee_shop/abi/ERC20.g.dart';
import 'package:cofee_shop/abi/Render.g.dart';
import 'package:cofee_shop/components/home_header.dart';
import 'package:cofee_shop/components/bases.dart';
import 'package:cofee_shop/const.dart';
import 'package:cofee_shop/theme.dart';
import 'package:cofee_shop/views/wallet.dart';
import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  final String userAddress;
  const HomePage({Key? key, required this.userAddress}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomeState();
}

Future<List<Base>> getBases(CoffeeShop shop, Render render) async {
  var baseLength = await shop.baseLength().then((value) => value.toInt());
  final List<Base> bases = [];

  for (var i = 0; i < baseLength; i++) {
    var base = await render
        .getBase(
          BigInt.from(i),
        )
        .then((value) => jsonDecode(value));

    var allowedSizes = await shop
        .getAllowedBaseComponents(
          BigInt.from(i),
        )
        .then((value) => value[0]);

    BigInt minPrice = BigInt.from(0);

    for (var size in allowedSizes) {
      final BigInt price =
          await shop.getSizeType(size).then((value) => value[2]);

      if (minPrice == BigInt.zero || price < minPrice) {
        minPrice = price;
      }
    }
    bases.add(Base(
      defaultSize: BigInt.from(base['defaultSize']),
      index: i,
      name: base['name'],
      price: BigInt.parse(base['price']),
      minPrice: minPrice + BigInt.parse(base['price']),
      image: ScalableImage.fromSvgString(base['image']),
    ));
  }
  return bases;
}

class _HomeState extends State<HomePage> {
  late CoffeeShop shop;
  late Render render;
  late ERC20 rubC;

  @override
  void initState() {
    super.initState();
    final Client httpClient = Client();
    final Web3Client ethClient = Web3Client(Const.RPC_HOST, httpClient);

    setState(() {
      shop = CoffeeShop(
          address: EthereumAddress.fromHex(Const.COFFEE_SHOP_ADDRESS),
          client: ethClient);

      render = Render(
          address: EthereumAddress.fromHex(Const.RENDER), client: ethClient);

      rubC = ERC20(
          address: EthereumAddress.fromHex(Const.RUBC_ADDRESS),
          client: ethClient);
    });
  }

  @override
  Widget build(BuildContext context) {
    String addr = ModalRoute.of(context)!.settings.arguments as String;

    if (addr == "") {
      return const Scaffold(
        body: Center(
          child: Text("Ошибка, приватный ключ не найден"),
        ),
      );
    }

    return CommonScaffold(
        address: addr,
        ethNode: shop.client,
        rubC: rubC,
        body: ListView(children: [
          FutureBuilder<List<Base>>(
              future: getBases(shop, render),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(children: [
                    Container(
                        padding: const EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: const Text("Магазин",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold))),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.2,
                      children: snapshot.data!
                          .map((e) => BaseCard(
                                base: e,
                                render: render,
                                rubC: rubC,
                                address: addr,
                                shop: shop,
                              ))
                          .toList(),
                    ),
                  ]);
                } else if (snapshot.hasError) {
                  final String error = snapshot.error.toString();
                  return Center(
                    child: Text("Ошибка:$error"),
                  );
                } else {
                  return Column(children: [
                    Container(
                        padding: const EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: const Text("Магазин",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold))),
                    const Center(
                      child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: CircularProgressIndicator()),
                    )
                  ]);
                }
              })
        ]));
  }
}

class CommonScaffold extends StatelessWidget {
  final Widget body;
  final String address;
  final Web3Client ethNode;
  final ERC20 rubC;

  const CommonScaffold(
      {Key? key,
      required this.body,
      required this.address,
      required this.ethNode,
      required this.rubC})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(address: address, ethNode: ethNode, rubC: rubC),
        backgroundColor: AppTheme.whiteColor,
        body: body,
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              child: BottomNavigationBar(
                backgroundColor: AppTheme.primaryColor,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppTheme.whiteColor,
                unselectedItemColor: AppTheme.whiteColor,
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w700),
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w500),
                onTap: (value) => {
                  if (value == 0)
                    {
                      Navigator.pushNamed(context, HomePage.routeName,
                          arguments: address)
                    }
                  else
                    {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WalletPage(
                                    userAddress: address,
                                  )))
                    }
                },
                items: const [
                  BottomNavigationBarItem(
                    label: 'Магазин',
                    icon: Icon(
                      Icons.coffee_maker,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Кошелек',
                    icon: Icon(
                      Icons.wallet,
                    ),
                  ),
                ],
              ),
            )));
  }
}
