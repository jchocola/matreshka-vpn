import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/theme/app_color.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
).copyWith(
  cardColor: AppColor.bgColor,


  colorScheme: ColorScheme.light(
    primary: AppColor.activeColor,

    secondary: AppColor.secondColor,

    tertiary: AppColor.inActiveColor,

  ),
);
