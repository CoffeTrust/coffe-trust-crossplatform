import 'package:cofee_shop/abi/CoffeeShop.g.dart';
import 'package:cofee_shop/abi/ERC20.g.dart';
import 'package:cofee_shop/abi/Render.g.dart';
import 'package:cofee_shop/theme.dart';
import 'package:cofee_shop/views/product_details.dart';
import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';

class Base {
  final String name;
  final BigInt price;
  final BigInt minPrice;
  final ScalableImage image;
  final BigInt defaultSize;
  final int index;

  const Base(
      {required this.index,
      required this.name,
      required this.price,
      required this.minPrice,
      required this.defaultSize,
      required this.image});
}

class BaseCard extends StatelessWidget {
  final Base base;
  final CoffeeShop shop;
  final Render render;
  final ERC20 rubC;
  final String address;

  const BaseCard(
      {Key? key,
      required this.base,
      required this.shop,
      required this.render,
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
                builder: (context) => ProducDetailsScreen(
                      base: base,
                      shop: shop,
                      render: render,
                      rubC: rubC,
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: AppTheme.primaryColor),
                    height: MediaQuery.of(context).size.width / 3.5,
                    width: MediaQuery.of(context).size.width / 3.5,
                    child: ScalableImageWidget(si: base.image),
                  ),
                ]),
                Row(children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 4,
                      padding: const EdgeInsets.only(top: 20, left: 5),
                      child: Text(
                        base.name,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 70, 37, 0),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: AppTheme.primaryColor),
                        child: Text(
                          "от ₽" +
                              (BigInt.parse(base.minPrice.toString()) /
                                      BigInt.from(10).pow(18))
                                  .toStringAsFixed(0),
                          style: const TextStyle(
                            color: AppTheme.whiteColor,
                            fontSize: 12,
                          ),
                        ),
                      ))
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
