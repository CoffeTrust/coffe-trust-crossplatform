import 'dart:convert';

import 'package:cofee_shop/abi/CoffeeShop.g.dart';
import 'package:cofee_shop/abi/ERC20.g.dart';
import 'package:cofee_shop/abi/Render.g.dart';
import 'package:cofee_shop/components/coffee_card.dart';
import 'package:cofee_shop/const.dart';
import 'package:cofee_shop/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

class UserCoffee {
  final String baseName;
  final String sizeName;
  final String milkName;
  final ScalableImage? milkImage;
  final String syrupName;
  final ScalableImage? syrupImage;
  final String powderName;
  final ScalableImage? powderImage;
  final ScalableImage image;
  final BigInt price;
  final BigInt tokenId;

  UserCoffee({
    required this.tokenId,
    required this.baseName,
    required this.sizeName,
    required this.milkName,
    required this.milkImage,
    required this.syrupName,
    required this.syrupImage,
    required this.powderName,
    required this.powderImage,
    required this.image,
    required this.price,
  });
}

Future<List<UserCoffee>> getUserProducts(
    String userAddress, CoffeeShop shop, Render render) async {
  final List<BigInt> ids =
      await shop.getUsersCoffee(EthereumAddress.fromHex(userAddress));

  List<UserCoffee> coffees = [];

  for (var id in ids) {
    final coffeeRaw = await render.getProduct(id);
    final coffee = jsonDecode(coffeeRaw);

    coffees.add(UserCoffee(
      tokenId: id,
      baseName: coffee['baseName'],
      sizeName: coffee['sizeName'],
      milkName: coffee['milkName'],
      milkImage: coffee['milkImage'] != ""
          ? ScalableImage.fromSvgString(coffee['milkImage'])
          : null,
      syrupName: coffee['syrupName'],
      syrupImage: coffee['syrupImage'] != ""
          ? ScalableImage.fromSvgString(coffee['syrupImage'])
          : null,
      powderName: coffee['powderName'],
      powderImage: coffee['powderImage'] != ""
          ? ScalableImage.fromSvgString(coffee['powderImage'])
          : null,
      image: ScalableImage.fromSvgString(coffee['image']),
      price: BigInt.parse(coffee['cost']),
    ));
  }
  return coffees;
}

class WalletPage extends StatefulWidget {
  final String userAddress;
  const WalletPage({Key? key, required this.userAddress}) : super(key: key);

  static const routeName = '/wallet';

  @override
  State<WalletPage> createState() => WallteState();
}

class WallteState extends State<WalletPage> {
  bool isLoading = true;
  late CoffeeShop shop;
  late Render render;
  late ERC20 rubC;
  late List<UserCoffee> userCoffees;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

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
    getUserProducts(widget.userAddress, shop, render).then((coffees) {
      setState(() {
        userCoffees = coffees;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Client httpClient = Client();
    final Web3Client ethClient = Web3Client(Const.RPC_HOST, httpClient);

    final ERC20 rubC = ERC20(
        address: EthereumAddress.fromHex(Const.RUBC_ADDRESS),
        client: ethClient);
    final CoffeeShop shop = CoffeeShop(
        address: EthereumAddress.fromHex(Const.COFFEE_SHOP_ADDRESS),
        client: ethClient);

    if (widget.userAddress == "") {
      return const Scaffold(
        body: Center(
          child: Text("Ошибка, приватный ключ не найден"),
        ),
      );
    }

    return CommonScaffold(
        address: widget.userAddress,
        ethNode: ethClient,
        rubC: rubC,
        body: isLoading
            ? Column(children: [
                Container(
                    padding: const EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: const Text("Кошелек",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold))),
                const Center(child: CircularProgressIndicator())
              ])
            : ListView(children: [
                Container(
                    padding: const EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: const Text("Кошелек",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold))),
                userCoffees.length == 0
                    ? Container(
                        padding: const EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: const Text("<пусто>",
                            style: TextStyle(
                                color: Color.fromARGB(255, 99, 97, 94),
                                fontSize: 15,
                                fontWeight: FontWeight.bold)))
                    : GridView.count(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.4,
                        children: userCoffees
                            .map((e) => UserCoffeeCard(
                                  coffee: e,
                                  rubC: rubC,
                                  address: widget.userAddress,
                                  shop: shop,
                                ))
                            .toList(),
                      ),
              ]));
  }
}
