import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:recipie_saver_flutter/logic/AuthLogic.dart";

class ResponsiveLayout extends StatelessWidget {
  final Widget MobileLoginScaffold;
  final Widget TabletLoginScaffold;
  final Widget DesktopLoginScaffold;

  final Widget MobileAppPage;
  final Widget TabletAppPage;
  final Widget DesktopAppPage;

  ResponsiveLayout(
      {required this.MobileLoginScaffold,
      required this.TabletLoginScaffold,
      required this.DesktopLoginScaffold,
      required this.MobileAppPage,
      required this.TabletAppPage,
      required this.DesktopAppPage});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return StreamBuilder<User?>(
            stream: AuthLogic().authStateChanges,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MobileAppPage;
              } else {
                return MobileLoginScaffold;
              }
            },
          );
        } else if (constraints.maxWidth < 1100) {
          return TabletLoginScaffold;
        } else {
          return DesktopLoginScaffold;
        }
      },
    );
  }
}
