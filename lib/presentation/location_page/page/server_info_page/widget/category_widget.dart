import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';
import 'package:matreshka_vpn/widget/small_button_with_icon.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppConstant.appPadding * 2),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(AppConstant.borederRadius),
        color: theme.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Категории', style: theme.textTheme.titleLarge),

          Wrap(
            children: [
              smallButtonWithIcon(
                icon: AppIcon.fastIcon,
                title: 'Fast',
                containerColor: theme.colorScheme.primary.withOpacity(0.1),
                textColor: theme.colorScheme.primary,
              ),
              smallButtonWithIcon(
                icon: AppIcon.videoIcon,
                title: 'For video',
                containerColor: theme.colorScheme.primary.withOpacity(0.1),
                textColor: theme.colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
