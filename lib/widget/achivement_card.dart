import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';

class AchivementCard extends StatelessWidget {
  const AchivementCard({
    super.key,
    this.title = 'Title',
    this.subtitle = 'Subtitle',
    this.isLocked = false
  });
  final String title;
  final String subtitle;
  final bool isLocked;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(AppConstant.borederRadius),
      child: Blur(
        blur: isLocked ? 5.0 : 0.0,
        colorOpacity: isLocked ? 0.5 : 0,
        // blurColor: theme.colorScheme.primary.withOpacity(0.2),
        child: Container(
          padding: EdgeInsets.all(AppConstant.appPadding),
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.colorScheme.primary.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(AppConstant.borederRadius),
            color: theme.cardColor,
          ),

          child: ListTile(
            leading: _leading(context),
            title: Text(title, style: theme.textTheme.titleMedium),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppConstant.appPadding,
              children: [
                Text(subtitle, style: theme.textTheme.bodySmall),
                isLocked ? LinearProgressIndicator(
                  value: 0.3,
                  minHeight: AppConstant.linearProgressHeight,
                ) : SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _leading(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.colorScheme.primary,
      ),
      padding: EdgeInsets.all(AppConstant.appPadding),
      child: Icon(AppIcon.accountSettingIcon, size: AppConstant.bigIcon / 1.2),
    );
  }
}
