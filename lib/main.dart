import 'package:flutter/material.dart';
import 'package:recipie_saver_flutter/responsive/pages/AppPages/DesktopAppPage.dart';
import 'package:recipie_saver_flutter/responsive/pages/AppPages/MobileAppPage.dart';
import 'package:recipie_saver_flutter/responsive/pages/loginPages/DesktopLoginScaffolding.dart';
import 'package:recipie_saver_flutter/responsive/pages/loginPages/MobileLoginScaffolding.dart';
import 'package:recipie_saver_flutter/responsive/responsive_layout.dart';
import 'package:recipie_saver_flutter/static/ColorConfig.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final indexPageStateProvider = StateProvider<int>((ref) {
  return 0;
});

final FavoritetateProvider = StateProvider<bool>((ref) {
  return false;
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: <String, WidgetBuilder>{
      //   "/home": (BuildContext context) => const HomePage(),
      //   // "/favorite": (BuildContext context) => const SecretPage(),
      // },
      // initialRoute: "/home",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryColor,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: AppColors.primaryColor, //<-- SEE HERE
        ),
      ),
      home: ResponsiveLayout(
        MobileLoginScaffold: const MobileLoginScaffolding(),
        DesktopLoginScaffold: const DesktopLoginScaffolding(),
        MobileAppPage: const MobileAppPage(),
        DesktopAppPage: const DesktopAppPage(),
      ),
    );
  }
}
