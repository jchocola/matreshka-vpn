import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';

class TurnOnOffbutton extends StatelessWidget {
  const TurnOnOffbutton({super.key});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      width: size.width * 0.4,
      height: size.width * 0.4,
     
      decoration: BoxDecoration(
         color: theme.colorScheme.primary,
        shape:BoxShape.circle
      ),
      child: Center(child: Text(AppIcon.activeIconStr , style: theme.textTheme.titleLarge!.copyWith(fontSize: AppConstant.bigIcon),),),
    );
  }
}
