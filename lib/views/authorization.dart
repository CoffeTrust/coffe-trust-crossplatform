import 'package:cofee_shop/theme.dart';
import 'package:cofee_shop/utils/colors.dart';
import 'package:cofee_shop/views/homepage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web3dart/web3dart.dart';
import 'package:getwidget/getwidget.dart';
import 'package:cofee_shop/utils.dart';
import 'package:local_auth/local_auth.dart';

class Authorize extends StatefulWidget {
  const Authorize({Key? key}) : super(key: key);

  static const routeName = '/authorization';
  @override
  State<Authorize> createState() => _AuthorizeState();
}

class _AuthorizeState extends State<Authorize> {
  final LocalAuthentication auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(ColorConstant.teal700),
        ),
        child: Column(
          children: [
            const Spacer(),
            Container(
                child: const Text(
                    "Добавьте приватный ключ от существующего EVM-совместимого кошелька или создайте новый",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700))),
            const Spacer(),
            const WalletForm(),
            const Spacer(),
            Container(
                padding: const EdgeInsets.only(bottom: 50),
                child: RichText(
                    text: TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            createWallet(auth: auth).then((userAddress) => {
                                  Navigator.pushReplacementNamed(
                                      context, HomePage.routeName,
                                      arguments: userAddress)
                                });
                          },
                        text: "Создать кошелек",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.dashed,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300))))
          ],
        ),
      ),
    );
  }
}

// Create a Form widget.
class WalletForm extends StatefulWidget {
  const WalletForm({super.key});

  @override
  WalletFormState createState() {
    return WalletFormState();
  }
}

class WalletFormState extends State<WalletForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _pkController = TextEditingController();
    final LocalAuthentication auth = LocalAuthentication();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              alignment: Alignment.center,
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppTheme.secondaryColor)),
              child: TextFormField(
                controller: _pkController,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: AppTheme.whiteColor),
                decoration: const InputDecoration(
                    errorStyle:
                        TextStyle(color: Colors.transparent, fontSize: 0),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.key),
                    prefixIconColor: AppTheme.secondaryColor,
                    fillColor: AppTheme.secondaryColor,
                    hintStyle: TextStyle(
                      color: AppTheme.secondaryColor,
                    ),
                    hintText: "0x..."),
                // The validator receives the text that the user has entered.
                validator: (pk) {
                  if (pk != null && pk != "") {
                    try {
                      EthPrivateKey.fromHex(pk);
                      return null;
                    } catch (e) {
                      return "$e";
                    }
                  }
                  return "Пустой ключ";
                },
              )),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 50),
            alignment: Alignment.center,
            height: 60,
            width: double.infinity,
            child: GFButton(
              onPressed: () async {
                _formKey.currentState?.save();

                if (_formKey.currentState!.validate()) {
                  await setPk(auth: auth, secret: _pkController.text)
                      .then((value) {
                    if (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Кошелек добавлен')));
                      Navigator.pushReplacementNamed(context, "/home",
                          arguments: _pkController.text);
                    }
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Неверный формат ключа')),
                  );
                }
              },
              text: "Добавить кошелек",
              shape: GFButtonShape.pills,
              size: 100,
              color: AppTheme.primaryColor,
              padding: const EdgeInsets.only(left: 30, right: 30),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: AppTheme.whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
