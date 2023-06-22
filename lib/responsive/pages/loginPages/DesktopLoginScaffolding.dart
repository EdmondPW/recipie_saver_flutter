import 'package:flutter/material.dart';
import 'package:recipie_saver_flutter/static/ColorConfig.dart';
import 'package:recipie_saver_flutter/static/LoginDesktopPage.dart';

class DesktopLoginScaffolding extends StatefulWidget {
  const DesktopLoginScaffolding({super.key});

  @override
  State<DesktopLoginScaffolding> createState() =>
      _DesktopLoginScaffoldingState();
}

class _DesktopLoginScaffoldingState extends State<DesktopLoginScaffolding> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
          child: Container(
        width: width,
        height: height,
        color: AppColors.primaryColor,
        child: Stack(
          children: [
            SizedBox(
              width: width / 2,
              child: const Image(
                fit: BoxFit.fitWidth,
                image: AssetImage(
                    'assets/image/large-screen-images/ilustrasi-web.png'),
              ),
            ),
            const SizedBox(
              width: 100,
              child: Padding(
                padding: EdgeInsets.only(left: 30),
                child: Image(
                    image: AssetImage(
                        'assets/image/large-screen-images/logo-web.png')),
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(65),
                      bottomLeft: Radius.circular(65)),
                  child: Container(
                    width: width * 0.55,
                    height: height,
                    color: AppColors.mainColor,
                    child: const LoginDesktopPage(),
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
