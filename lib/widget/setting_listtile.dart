import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';

class SettingListtile extends StatelessWidget {
  const SettingListtile({
    super.key,
    this.title = 'Title',
    this.subTitle = 'Subtitle',
    this.icon = Icons.abc,
    this.onTap
  });
  final String title;
  final String subTitle;
  final IconData icon;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: leadingWidget(context , icon: icon),
        title: Text(title, style: theme.textTheme.titleMedium),
        subtitle: Text(subTitle, style: theme.textTheme.bodySmall),
        trailing: Icon(
          AppIcon.arrowForwoardicon,
          size: AppConstant.iconSize,
          color: theme.colorScheme.tertiary,
        ),
      ),
    );
  }

  Widget leadingWidget(context, {IconData icon = Icons.abc}) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(AppConstant.appPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstant.borederRadius),
        color: theme.colorScheme.primary.withOpacity(0.2),
      ),
      child: Icon(icon, color: theme.colorScheme.primary),
    );
  }
}
