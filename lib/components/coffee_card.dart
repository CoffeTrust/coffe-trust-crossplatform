import 'package:cofee_shop/abi/CoffeeShop.g.dart';
import 'package:cofee_shop/abi/ERC20.g.dart';
import 'package:cofee_shop/theme.dart';
import 'package:cofee_shop/views/coffee_details.dart';
import 'package:cofee_shop/views/wallet.dart';
import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';

class UserCoffeeCard extends StatelessWidget {
  final UserCoffee coffee;
  final CoffeeShop shop;
  final ERC20 rubC;
  final String address;

  const UserCoffeeCard(
      {Key? key,
      required this.coffee,
      required this.shop,
      required this.rubC,
      required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CoffeeDetailedScreen(
                      rubC: rubC,
                      userCoffee: coffee,
                      shop: shop,
                      address: address,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(3, 5),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  Spacer(),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: AppTheme.primaryColor),
                    height: MediaQuery.of(context).size.width / 3.3,
                    width: MediaQuery.of(context).size.width / 3.3,
                    child: ScalableImageWidget(si: coffee.image),
                  ),
                  Spacer(),
                ]),
                Column(children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 4,
                      padding: const EdgeInsets.only(top: 20, left: 5),
                      child: Text(
                        coffee.sizeName,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 70, 37, 0),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width / 4,
                      padding: const EdgeInsets.only(top: 8, left: 5),
                      child: Text(
                        coffee.baseName,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 70, 37, 0),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width / 4,
                      padding: const EdgeInsets.only(top: 8, left: 5),
                      child: Text(
                        "Token ID: ${coffee.tokenId.toString()}",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 70, 37, 0),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
