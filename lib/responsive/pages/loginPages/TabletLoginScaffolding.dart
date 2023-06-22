import 'package:flutter/material.dart';
import 'package:recipie_saver_flutter/static/LoginMobilePage.dart';
import 'package:recipie_saver_flutter/static/ColorConfig.dart';

class TabletLoginScaffolding extends StatefulWidget {
  const TabletLoginScaffolding({super.key});

  @override
  State<TabletLoginScaffolding> createState() => _TabletLoginScaffoldingState();
}

class _TabletLoginScaffoldingState extends State<TabletLoginScaffolding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: AppColors.primaryColor,
            child: const Image(
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                image: AssetImage(
                    'assets/image/mobile-screen-images/ilustrasi-mobile-01.png')),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height / 2,
          ),
          const LoginMobilePage()
        ],
      ),
    );
  }
}
