// ignore_for_file: file_names, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();

  _authenticate(BuildContext context) async {
    final token =
        await Magic.instance.auth.loginWithMagicLink(email: _controller.text);

    //print(token);
    print("email in Successfully");
  }

  _authenticateWithOTP(BuildContext context) async {
    final token = await Magic.instance.auth
        .loginWithSMS(phoneNumber: _otpcontroller.text);

    //print(token);
    print("phone in Successfully");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              "Welcome".text.xl4.black.bold.make(),
              VxTextField(
                controller: _controller,
                borderType: VxTextFieldBorderType.roundLine,
                borderColor: Vx.purple500,
                hint: "Enter Email",
              ).p32(),
              ElevatedButton(
                      onPressed: () {
                        _authenticate(context);
                      },
                      child: "Login".text.bold.make())
                  .wFourFifth(context),
              VxTextField(
                controller: _otpcontroller,
                borderType: VxTextFieldBorderType.roundLine,
                borderColor: Vx.purple500,
                hint: "Enter Phone Number",
              ).p32(),
              ElevatedButton(
                      onPressed: () {
                        _authenticateWithOTP(context);
                      },
                      child: "Login with OTP".text.bold.make())
                  .wFourFifth(context),
            ],
          ).p16().centered(),
        ],
      ),
    );
  }

  Widget _background() {
    return VxBox()
        .gradientVia(
          from: Vx.purple200,
          via: Vx.purple400,
          to: Vx.purple600,
        )
        .make();
  }
}
