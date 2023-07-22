import 'dart:convert';

import 'package:cofee_shop/abi/CoffeeShop.g.dart';
import 'package:cofee_shop/abi/ERC20.g.dart';
import 'package:cofee_shop/abi/Render.g.dart';
import 'package:cofee_shop/components/bases.dart';
import 'package:cofee_shop/const.dart';
import 'package:cofee_shop/theme.dart';
import 'package:cofee_shop/utils.dart';
import 'package:cofee_shop/views/homepage.dart';
import 'package:cofee_shop/views/wallet.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:web3dart/json_rpc.dart';
import 'package:web3dart/web3dart.dart';

class Size {
  final String name;
  final BigInt price;
  final ScalableImage image;
  final BigInt index;

  const Size(
      {required this.name,
      required this.price,
      required this.image,
      required this.index});
}

class Milk {
  final String name;
  final ScalableImage? image;
  final BigInt index;

  const Milk({required this.name, required this.image, required this.index});
}

class Syrup {
  final String name;
  final ScalableImage? image;
  final BigInt price;
  final BigInt index;

  const Syrup(
      {required this.name,
      required this.image,
      required this.price,
      required this.index});
}

class Powder {
  final String name;
  final ScalableImage? image;
  final BigInt price;
  final BigInt index;

  const Powder(
      {required this.name,
      required this.image,
      required this.price,
      required this.index});
}

class PossibleProduct {
  final List<Size> sizes;
  final List<Milk> milks;
  final List<Syrup> syrups;
  final List<Powder> powders;

  PossibleProduct(
      {required this.sizes,
      required this.milks,
      required this.syrups,
      required this.powders});
}

Future<void> txWait(String hash, Web3Client client) async {
  var receipt = await client.getTransactionReceipt(hash);
  while (receipt == null) {
    await Future.delayed(const Duration(seconds: 1));
    receipt = await client.getTransactionReceipt(hash);
  }
}

String weiToRub(BigInt wei) {
  return (wei / BigInt.from(10).pow(18)).toString();
}

String calcSelectedPrice(Syrup syrup, Powder powder, Size size, Base base) {
  var price = base.price + size.price + syrup.price + powder.price;

  return weiToRub(price);
}

Future<List<Size>> getAllowedSizes(List<dynamic> sizeIds, Render render) async {
  List<Size> sizes = [];

  for (var sizeId in sizeIds) {
    var sizeString =
        await render.getGlass(sizeId as BigInt).then((value) => value);
    var size = jsonDecode(sizeString);

    sizes.add(Size(
        index: sizeId,
        name: size['name'],
        price: BigInt.parse(size['price']),
        image: ScalableImage.fromSvgString(size['image'])));
  }
  return sizes;
}

Future<List<Milk>> getAllowedMilks(List<dynamic> milkIds, Render render) async {
  List<Milk> milks = [];

  for (var milkId in milkIds) {
    var milkString =
        await render.getStockMilk(milkId as BigInt).then((value) => value);
    var milk = jsonDecode(milkString);

    milks.add(Milk(
        index: milkId,
        name: milk['name'],
        image: milk['image'] != ""
            ? ScalableImage.fromSvgString(milk['image'])
            : null));
  }
  return milks;
}

Future<List<Syrup>> getAllowedSyrups(
    List<dynamic> syrupIds, Render render) async {
  List<Syrup> syrups = [];

  for (var syrupId in syrupIds) {
    var syrupString =
        await render.getStockSyrup(syrupId as BigInt).then((value) => value);
    var syrup = jsonDecode(syrupString);

    syrups.add(Syrup(
        index: syrupId,
        name: syrup['name'],
        price: BigInt.parse(syrup['price']),
        image: syrup['image'] != ""
            ? ScalableImage.fromSvgString(syrup['image'])
            : null));
  }
  return syrups;
}

Future<List<Powder>> getAllowedPowders(
    List<dynamic> powderIds, Render render) async {
  List<Powder> powders = [];

  for (var powderId in powderIds) {
    var powderString =
        await render.getStockPowder(powderId as BigInt).then((value) => value);
    var powder = jsonDecode(powderString);

    powders.add(Powder(
        index: powderId,
        name: powder['name'],
        price: BigInt.parse(powder['price']),
        image: powder['image'] != "" && !powder['image'].startsWith(".")
            ? ScalableImage.fromSvgString(powder['image'])
            : null));
  }
  return powders;
}

Future<PossibleProduct> getAllowedComponents(
    int baseId, CoffeeShop shop, Render render) async {
  var [sizeIds, milkIds, syrupIds, powderIds] =
      await shop.getAllowedBaseComponents(BigInt.from(baseId));

  return PossibleProduct(
      sizes: await getAllowedSizes(sizeIds, render),
      milks: await getAllowedMilks(milkIds, render),
      syrups: await getAllowedSyrups(syrupIds, render),
      powders: await getAllowedPowders(powderIds, render));
}

class ProducDetailsScreen extends StatefulWidget {
  final Base base;
  final CoffeeShop shop;
  final Render render;
  final ERC20 rubC;
  final String address;

  const ProducDetailsScreen(
      {Key? key,
      required this.base,
      required this.shop,
      required this.render,
      required this.rubC,
      required this.address})
      : super(key: key);
  @override
  State<ProducDetailsScreen> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProducDetailsScreen> {
  PossibleProduct? allowedComponents;
  bool isLoaded = false;
  bool buyTxInProgress = false;
  Error? error;
  RPCError? rpcError;
  Size? selectedSize;
  Milk? selectedMilk;
  Syrup? selectedSyrup;
  Powder? selectedPowder;
  String selectedPrice = "0";

  @override
  void initState() {
    super.initState();
    buyTxInProgress = false;

    getAllowedComponents(widget.base.index, widget.shop, widget.render)
        .then((value) {
      setState(() {
        allowedComponents = value;
        isLoaded = true;
        selectedSize = allowedComponents!.sizes[0];
        selectedMilk = allowedComponents!.milks[0];
        selectedSyrup = allowedComponents!.syrups[0];
        selectedPowder = allowedComponents!.powders[0];

        selectedPrice = calcSelectedPrice(
            selectedSyrup!, selectedPowder!, selectedSize!, widget.base);
      });
    }).catchError((e) {
      setState(() {
        error = e;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (error != null || rpcError != null) {
      var e = error ?? rpcError;

      return CommonScaffold(
          address: widget.address,
          rubC: widget.rubC,
          ethNode: widget.shop.client,
          body: Center(child: Text("Ошибка: $e")));
    }

    if (!isLoaded) {
      return CommonScaffold(
          address: widget.address,
          rubC: widget.rubC,
          ethNode: widget.shop.client,
          body: const Center(child: CircularProgressIndicator()));
    }

    return CommonScaffold(
        address: widget.address,
        rubC: widget.rubC,
        ethNode: widget.shop.client,
        body: Container(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(widget.base.name,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 65, 20, 0),
                        fontWeight: FontWeight.w700,
                        fontSize: 22)),
              ),
              Row(
                children: [
                  Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: AppTheme.primaryColor),
                      child: ScalableImageWidget(si: widget.base.image)),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          OptionLabel(
                              text: "Молоко:",
                              value: selectedMilk != null
                                  ? selectedMilk!.name
                                  : allowedComponents!.milks[0].name),
                          OptionLabel(
                              text: "Сироп:",
                              value: selectedSyrup != null
                                  ? selectedSyrup!.name
                                  : allowedComponents!.syrups[0].name),
                          OptionLabel(
                              text: "Присыпка:",
                              value: selectedPowder != null
                                  ? selectedPowder!.name
                                  : allowedComponents!.powders[0].name),
                        ],
                      )),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 60,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    GroupButton(
                        onSelected: (value, index, isSelected) => setState(() {
                              selectedSize = allowedComponents!.sizes[index];
                              selectedPrice = calcSelectedPrice(selectedSyrup!,
                                  selectedPowder!, selectedSize!, widget.base);
                            }),
                        options: GroupButtonOptions(
                          spacing: 10,
                          selectedColor: AppTheme.primaryColor,
                          unselectedBorderColor: AppTheme.primaryColor,
                          unselectedColor: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          unselectedTextStyle: const TextStyle(
                              color: Color.fromARGB(255, 65, 20, 0),
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                          selectedTextStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        buttons: allowedComponents!.sizes
                            .map((e) => e.name)
                            .toList())
                  ])),
              Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      const Text(
                        "Молоко",
                        style: TextStyle(
                            color: Color.fromARGB(255, 65, 20, 0),
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      Container(
                          width: 250,
                          padding: const EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: DropdownButton<Milk>(
                            isExpanded: true,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 65, 20, 0),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                            value: selectedMilk ?? allowedComponents!.milks[0],
                            onChanged: (value) {
                              setState(() {
                                selectedMilk = value;
                              });
                            },
                            items: allowedComponents!.milks
                                .map((Milk e) => DropdownMenuItem<Milk>(
                                      value: e,
                                      child: Text(e.name),
                                    ))
                                .toList(),
                          )),
                    ],
                  )),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Сироп",
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 20, 0),
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
              Container(
                  height: 50,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    GroupButton(
                        onSelected: (value, index, isSelected) => setState(() {
                              selectedSyrup = allowedComponents!.syrups[index];
                              selectedPrice = calcSelectedPrice(
                                  selectedSyrup!,
                                  selectedPowder!,
                                  allowedComponents!.sizes[0],
                                  widget.base);
                            }),
                        options: GroupButtonOptions(
                          spacing: 10,
                          selectedColor: AppTheme.primaryColor,
                          unselectedBorderColor: AppTheme.primaryColor,
                          unselectedColor: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          unselectedTextStyle: const TextStyle(
                              color: Color.fromARGB(255, 65, 20, 0),
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                          selectedTextStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        buttons: allowedComponents!.syrups
                            .map((e) => e.name)
                            .toList())
                  ])),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Присыпка",
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 20, 0),
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
              Container(
                  height: 50,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    GroupButton(
                        onSelected: (value, index, isSelected) => setState(() {
                              selectedPowder =
                                  allowedComponents!.powders[index];
                              selectedPrice = calcSelectedPrice(selectedSyrup!,
                                  selectedPowder!, selectedSize!, widget.base);
                            }),
                        options: GroupButtonOptions(
                          spacing: 10,
                          selectedColor: AppTheme.primaryColor,
                          unselectedBorderColor: AppTheme.primaryColor,
                          unselectedColor: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          unselectedTextStyle: const TextStyle(
                              color: Color.fromARGB(255, 65, 20, 0),
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                          selectedTextStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        buttons: allowedComponents!.powders
                            .map((e) => e.name)
                            .toList())
                  ])),
              !buyTxInProgress
                  ? Container(
                      padding: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppTheme.primaryColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                          onPressed: () {
                            setState(() {
                              final auth = LocalAuthentication();

                              getPk(auth).then((privateKey) async {
                                if (privateKey == null) {
                                  setState(() {
                                    error =
                                        AssertionError("Ошибка авторизации");
                                  });
                                }

                                final creds =
                                    EthPrivateKey.fromHex(privateKey as String);

                                var mintParams = [
                                  BigInt.from(widget.base.index),
                                  selectedSize!.index,
                                  selectedMilk!.index,
                                  selectedSyrup!.index,
                                  selectedPowder!.index
                                ];

                                var toApprove = selectedSize!.price +
                                    selectedSyrup!.price +
                                    selectedPowder!.price +
                                    widget.base.price;

                                var approveHash = await widget.rubC.approve(
                                    EthereumAddress.fromHex(
                                        Const.COFFEE_SHOP_ADDRESS),
                                    toApprove,
                                    credentials: creds);

                                await txWait(approveHash, widget.shop.client);

                                var mintHash = await widget.shop
                                    .mintCoffee(mintParams, credentials: creds);

                                await txWait(mintHash, widget.shop.client)
                                    .then((value) => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => WalletPage(
                                                userAddress: widget.address))))
                                    .catchError((e) {
                                  setState(() {
                                    rpcError = e;
                                    buyTxInProgress = false;
                                  });
                                });
                              });

                              buyTxInProgress = true;
                            });
                          },
                          child: Text("Купить за $selectedPrice ₽",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18))),
                    )
                  : const Center(child: CircularProgressIndicator())
            ])));
  }
}

class OptionLabel extends StatelessWidget {
  final String text;
  final String value;

  const OptionLabel({Key? key, required this.text, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Text(text,
              style: const TextStyle(
                  color: Color.fromARGB(255, 65, 20, 0),
                  fontWeight: FontWeight.w700,
                  fontSize: 16)),
          Text(
            value,
            style: const TextStyle(
                color: Color.fromARGB(255, 65, 20, 0),
                fontWeight: FontWeight.w400,
                fontSize: 13),
          )
        ],
      ),
    );
  }
}
