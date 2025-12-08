import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';

class PrivacyOnOff extends StatelessWidget {
  const PrivacyOnOff({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      spacing: AppConstant.appPadding,
      children: [
        Icon(AppIcon.notPotectedIcon, size: AppConstant.iconSize),
        Text('Защита выключена',style: theme.textTheme.bodyMedium,),
      ],
    );
  }
}
