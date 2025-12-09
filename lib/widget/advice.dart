import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';

class Advice extends StatelessWidget {
  const Advice({super.key, this.content = 'Advice'});
  final String content;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(AppConstant.appPadding),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(AppConstant.borederRadius),
        // color: theme.colorScheme.tertiary.withOpacity(0.1),
      ),
      child: Row(
        spacing: AppConstant.appPadding,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(AppIcon.infoIcon),
          Flexible(
            child: Text(
              content,
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
