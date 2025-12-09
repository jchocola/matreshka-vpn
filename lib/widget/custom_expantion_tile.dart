import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';

class CustomExpantionTile extends StatelessWidget {
  const CustomExpantionTile({
    super.key,
    this.title = 'Title',
    this.subtitle = 'Subtitle',
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ExpansionTile(
        childrenPadding: EdgeInsets.all(AppConstant.appPadding),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppConstant.appPadding + 5,
        ), // Rounded corners when collapsed
        side: BorderSide(
          color: theme.colorScheme.tertiary.withOpacity(0.2),
          width: 1.0,
        ), // Blue border when collapsed
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppConstant.appPadding + 5,
        ), // Rounded corners when collapsed
        side: BorderSide(
          color: theme.colorScheme.tertiary.withOpacity(0.2),
          width: 1.0,
        ), // Blue border when collapsed
      ),
      backgroundColor: theme.cardColor,
      collapsedBackgroundColor: theme.cardColor,

      title: Text(title, style: theme.textTheme.titleMedium),
      children: [
        Text(
          subtitle,
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
