import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';

class PickedServerButton extends StatelessWidget {
  const PickedServerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal:  AppConstant.appPadding * 2),
      padding: EdgeInsets.all(AppConstant.appPadding),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.1),
            spreadRadius: AppConstant.spreadRadius,
            blurRadius: AppConstant.blurRadius,
          ),
        ],
        border: Border.all(
          color: theme.colorScheme.tertiary.withOpacity(0.3),
          width: 1,
        ),
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(AppConstant.borederRadius),
      ),

      child: Column(
        spacing: AppConstant.appPadding,
        children: [
          Row(
            spacing: AppConstant.appPadding,
            children: [
              buildIconContainer(context),
              buildServerInfo(context),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(AppIcon.arrowForwoardicon , size: AppConstant.iconSize,),
              ),
            ],
          ),

          Row(
            spacing: AppConstant.appPadding,
            children: [
              Icon(AppIcon.protectedIcon, size: AppConstant.iconSize),
              Text('Активное подключение', style: theme.textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildIconContainer(context) {
    final theme = Theme.of(context);
    return Container(
      // margin: EdgeInsets.all(AppConstant.appPadding),
      padding: EdgeInsets.all(AppConstant.appPadding),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.tertiary.withOpacity(0.3)),
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(AppConstant.borederRadius / 2),
      ),
      child: Text(AppIcon.matreshkaIconStr),
    );
  }

  Widget buildServerInfo(context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Автоматический выбор', style: theme.textTheme.titleSmall),
        Text('Пинг: 45ms', style: theme.textTheme.bodySmall),
      ],
    );
  }
}
