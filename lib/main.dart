import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/router/router.dart';
import 'package:matreshka_vpn/core/theme/dark_theme.dart';
import 'package:matreshka_vpn/core/theme/light_theme.dart';
import 'package:matreshka_vpn/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.light,
      builder:(lightTheme,darkTheme)=> MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
       
      ),
    );
  }
}
