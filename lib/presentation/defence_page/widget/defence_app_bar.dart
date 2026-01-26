import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';

class DefenceAppBar extends StatelessWidget {
  const DefenceAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      spacing: AppConstant.appPadding,
      children: [
        Text(AppIcon.matreshkaIconStr),
        Text('Matreshka VPN', style: theme.textTheme.titleLarge),
      ],
    );
  }
}
