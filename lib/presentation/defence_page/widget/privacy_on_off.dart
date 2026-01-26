import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';
import 'package:matreshka_vpn/presentation/defence_page/provider/defence_page_provider.dart';
import 'package:provider/provider.dart';

class PrivacyOnOff extends StatelessWidget {
  const PrivacyOnOff({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defencePageProvider_l = context.watch<DefencePageProvider>();
    return Row(
      spacing: AppConstant.appPadding,
      children: [
        Icon(defencePageProvider_l.isProtected ? AppIcon.protectedIcon : AppIcon.notPotectedIcon, size: AppConstant.iconSize),
        Text(defencePageProvider_l.isProtected ? 'Защита выключена' : 'Нет защиты', style: theme.textTheme.bodyMedium),
      ],
    );
  }
}
