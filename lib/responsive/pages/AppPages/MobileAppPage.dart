import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipie_saver_flutter/main.dart';
import 'package:recipie_saver_flutter/responsive/pages/AppWidgets/MobileFavoriteWidget.dart';
import 'package:recipie_saver_flutter/responsive/pages/AppWidgets/MobileHomeWidget.dart';
import 'package:recipie_saver_flutter/static/DrawerNavbar.dart';

class MobileAppPage extends ConsumerStatefulWidget {
  const MobileAppPage({super.key});

  @override
  ConsumerState<MobileAppPage> createState() => _MobileAppPageState();
}

class _MobileAppPageState extends ConsumerState<MobileAppPage> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(indexPageStateProvider);
    print('current index build: ${selectedIndex}');
    // List<Widget> mobileWidgetOptions = <Widget>[
    //   const MobileHomeWidget(),
    //   // MobileFavoriteScreen(),
    // ];

    Widget selectedWidget = const Placeholder();

    if (selectedIndex == 0) {
      selectedWidget = const MobileHomeWidget();
    } else if (selectedIndex == 1) {
      selectedWidget = const MobileFavoriteWidget();
    }

    return Scaffold(
      drawer: const DrawerNavbar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
            child: selectedWidget,
          ),
        ),
      ),
    );
  }
}
