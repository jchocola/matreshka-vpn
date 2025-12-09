import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title = 'title',
    this.leading = const SizedBox(),
  });
  final String title;
  final Widget leading;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Row(
        spacing: AppConstant.appPadding,
        children: [
        leading,
        Text(title, style: theme.textTheme.titleLarge)]),
    );
  }
}
