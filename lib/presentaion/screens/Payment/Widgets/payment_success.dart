import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopx/Screen_home.dart';
import 'package:shopx/presentaion/screens/Home/home_screen.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      Get.offUntil(
          MaterialPageRoute(
            builder: (context) => ScreenHome(),
          ),
          (route) => false);
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
          "https://assets2.lottiefiles.com/packages/lf20_wkebwzpz.json",
        ),
      ),
    );
  }
}
