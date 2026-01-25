import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/router/router.dart';
import 'package:matreshka_vpn/core/theme/dark_theme.dart';
import 'package:matreshka_vpn/core/theme/light_theme.dart';
import 'package:matreshka_vpn/data/repository/openvpn_repo_impl.dart';
import 'package:matreshka_vpn/main_page.dart';
import 'package:matreshka_vpn/presentation/defence_page/provider/defence_page_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> DefencePageProvider(openvpnRepository: OpenvpnRepoImpl.instance)),

      ],
      child: AdaptiveTheme(
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
      ),
    );
  }
}
