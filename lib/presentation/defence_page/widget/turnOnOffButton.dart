import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';
import 'package:matreshka_vpn/presentation/defence_page/provider/defence_page_provider.dart';
import 'package:provider/provider.dart';

class TurnOnOffbutton extends StatelessWidget {
  const TurnOnOffbutton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final defencePageProvider_l = context.watch<DefencePageProvider>();
    return Container(
      width: size.width * 0.4,
      height: size.width * 0.4,

      decoration: BoxDecoration(
        color: defencePageProvider_l.isProtected ? Colors.green : theme.colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          defencePageProvider_l.isProtected ?  AppIcon.activeIconStr : AppIcon.inactiveIconStr,
          style: theme.textTheme.titleLarge!.copyWith(
            fontSize: AppConstant.bigIcon,
          ),
        ),
      ),
    );
  }
}
