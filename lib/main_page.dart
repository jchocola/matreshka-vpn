import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.navShell});
  final StatefulNavigationShell navShell;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navShell.currentIndex,
        onTap: (value) {
          navShell.goBranch(value);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(AppIcon.defenceIcon),
            label: 'Defence',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcon.locationIcon),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcon.profileIcon),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
