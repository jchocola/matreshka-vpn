import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';

class SpeedInfoCard extends StatelessWidget {
  const SpeedInfoCard({
    super.key,
    this.icon = Icons.abc,
    this.value = 'title',
    this.containerColor = Colors.transparent,
    this.textColor = Colors.black,
    this.speed = 'speed',
    this.status = 'status'
  });
  final IconData icon;
  final String value;
  final String speed;
  final String status;
  final Color containerColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      
      padding: EdgeInsets.symmetric(
        vertical: AppConstant.appPadding,
        horizontal: AppConstant.appPadding,
      ),
      margin: EdgeInsets.symmetric(horizontal:  AppConstant.appPadding/2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstant.borederRadius),
        color: containerColor,
      ),
      child: Column(
        spacing: AppConstant.appPadding / 2,
        children: [
          Icon(icon, color: textColor,),
          Text(
            value,
            style: theme.textTheme.titleLarge!.copyWith(color: textColor),
          ),

          Text(
            speed,
            style: theme.textTheme.bodySmall!
          ),
          Text(
            status,
            style: theme.textTheme.bodyMedium!.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
