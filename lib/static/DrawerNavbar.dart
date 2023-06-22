import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipie_saver_flutter/logic/AuthLogic.dart';
import 'package:recipie_saver_flutter/main.dart';
import 'package:recipie_saver_flutter/static/ColorConfig.dart';

class DrawerNavbar extends ConsumerWidget {
  const DrawerNavbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double screenHeight = MediaQuery.of(context).size.height;
    AuthLogic auth = AuthLogic();
    final currentIndex = ref.watch(indexPageStateProvider);

    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: AppColors.primaryColor,
            height: screenHeight * 0.3,
            child: Text(
              'Welcome ${auth.currentUser?.email}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text('Home'),
            onTap: () {
              ref.read(indexPageStateProvider.notifier).update((state) => 0);
              print("Home index ${currentIndex}");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.favorite,
            ),
            title: const Text('Favorite'),
            onTap: () {
              ref.read(indexPageStateProvider.notifier).update((state) => 1);
              print("Favorite index ${currentIndex}");
              Navigator.pop(context);
            },
          ),
          Container(
            height: screenHeight * 0.5,
            alignment: AlignmentDirectional.bottomCenter,
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.primaryColor)),
                onPressed: () {
                  auth.signOutUser();
                },
                child: const Text("Logout")),
          )
        ],
      ),
    );
  }
}
