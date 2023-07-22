import 'package:cofee_shop/abi/CoffeeShop.g.dart';
import 'package:cofee_shop/abi/ERC20.g.dart';
import 'package:cofee_shop/theme.dart';
import 'package:cofee_shop/views/homepage.dart';
import 'package:cofee_shop/views/transfer.dart';
import 'package:cofee_shop/views/wallet.dart';
import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';

class CoffeeDetailedScreen extends StatelessWidget {
  final UserCoffee userCoffee;
  final CoffeeShop shop;
  final ERC20 rubC;
  final String address;

  const CoffeeDetailedScreen(
      {Key? key,
      required this.userCoffee,
      required this.shop,
      required this.rubC,
      required this.address})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        address: address,
        rubC: rubC,
        ethNode: shop.client,
        body: Container(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text("Ваш кофе",
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
                  child: ScalableImageWidget(si: userCoffee.image)),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(children: [
                  Text(userCoffee.sizeName,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 65, 20, 0),
                          fontWeight: FontWeight.w700,
                          fontSize: 22)),
                  Text(userCoffee.baseName,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 65, 20, 0),
                          fontWeight: FontWeight.w700,
                          fontSize: 22)),
                ]),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 30),
                    child: const Text("Молоко:",
                        style: TextStyle(
                            color: Color.fromARGB(255, 65, 20, 0),
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                  ),
                  Text(userCoffee.milkName,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 65, 20, 0),
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                  Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.only(left: 20),
                    child: userCoffee.milkImage == null
                        ? null
                        : ScalableImageWidget(
                            fit: BoxFit.contain,
                            si: userCoffee.milkImage as ScalableImage),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 30),
                    child: const Text("Сироп:",
                        style: TextStyle(
                            color: Color.fromARGB(255, 65, 20, 0),
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                  ),
                  Text(userCoffee.syrupName,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 65, 20, 0),
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                  Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.only(left: 20),
                    child: userCoffee.syrupImage == null
                        ? null
                        : ScalableImageWidget(
                            fit: BoxFit.contain,
                            si: userCoffee.syrupImage as ScalableImage),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 30),
                    child: const Text("Присыпка:",
                        style: TextStyle(
                            color: Color.fromARGB(255, 65, 20, 0),
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                  ),
                  Text(userCoffee.powderName,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 65, 20, 0),
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                  Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.only(left: 20),
                    child: userCoffee.powderImage == null
                        ? null
                        : ScalableImageWidget(
                            fit: BoxFit.contain,
                            si: userCoffee.powderImage as ScalableImage),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppTheme.primaryColor)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransferScreen(
                                      userCoffee: userCoffee,
                                      userAddress: address,
                                      rubC: rubC,
                                      shop: shop,
                                    )));
                      },
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          child: const Text("Передать",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18))),
                    ),
                    Spacer(),
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppTheme.primaryColor)),
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: const Text("Потратить \n(в разработке)",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12)),
                        ))
                  ],
                ),
              ),
            ])));
  }
}
