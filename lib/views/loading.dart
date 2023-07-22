import 'package:cofee_shop/utils.dart';
import 'package:flutter/material.dart';
import 'package:cofee_shop/utils/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          decoration: const BoxDecoration(color: Color(ColorConstant.teal700)),
          child: Center(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: svg(path: "assets/images/splash_coffee.svg")))),
      Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
          child: const SpinKitWave(
            color: Colors.white,
            size: 50.0,
          ))
    ]));
  }
}
