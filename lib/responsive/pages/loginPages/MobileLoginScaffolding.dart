import "package:flutter/material.dart";
import 'package:recipie_saver_flutter/static/LoginMobilePage.dart';
import 'package:recipie_saver_flutter/static/ColorConfig.dart';

class MobileLoginScaffolding extends StatefulWidget {
  const MobileLoginScaffolding({super.key});

  @override
  State<MobileLoginScaffolding> createState() => _MobileLoginScaffoldingState();
}

class _MobileLoginScaffoldingState extends State<MobileLoginScaffolding> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            color: AppColors.black,
          ),
          Container(
            height: height / 2,
            width: width,
            color: AppColors.primaryColor,
            child: const Image(
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                image: AssetImage(
                    'assets/image/mobile-screen-images/ilustrasi-mobile-01.png')),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: width,
                height: height / 1.8,
                child: const LoginMobilePage()),
          ),
        ],
      ),
    );
  }
}
