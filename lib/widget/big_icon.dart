import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    super.key,
    this.title = 'title',
    this.borderColor = Colors.black,
    this.icon = Icons.ac_unit_outlined,
    this.withIcon = false,
    this.textColor = Colors.black,
    this.bgColor = Colors.transparent
  });
  final String title;
  final Color borderColor;
  final IconData icon;
  final bool withIcon;
  final Color textColor;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      //   margin: EdgeInsets.all(AppConstant.appPadding),
      padding: EdgeInsets.all(AppConstant.appPadding),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1),
        color: bgColor,
        borderRadius: BorderRadius.circular(AppConstant.borederRadius),
      ),
      child: Row(
        spacing: AppConstant.appPadding,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          withIcon
              ? Icon(icon, size: AppConstant.iconSize, color: textColor)
              : SizedBox(),
          Text(
            title,
            style: theme.textTheme.bodyMedium!.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
