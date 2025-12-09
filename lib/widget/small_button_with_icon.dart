import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';

class smallButtonWithIcon extends StatelessWidget {
  const smallButtonWithIcon({
    super.key,
    this.icon = Icons.abc,
    this.title = 'title',
    this.containerColor = Colors.transparent,
    this.textColor = Colors.black,
  });
  final IconData icon;
  final String title;
  final Color containerColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical:  AppConstant.appPadding / 2 , horizontal: AppConstant.appPadding),
      margin: EdgeInsets.only(right: AppConstant.appPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstant.borederRadius),
        color: containerColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: AppConstant.appPadding/3,
        children: [
          Icon(icon, color: textColor, size: AppConstant.iconSize),
          Text(
            title,
            style: theme.textTheme.bodyMedium!.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
