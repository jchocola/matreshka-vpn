import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';

class SelectorWidget extends StatelessWidget {
  const SelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List optionList = [
      {'title': 'All', 'icon': AppIcon.allIcon},
      {'title': 'Ближайшее', 'icon': AppIcon.nearIcon},

      {'title': 'Для видео', 'icon': AppIcon.videoIcon},
      {'title': 'Быстрые', 'icon': AppIcon.fastIcon},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(optionList.length, (index) {
          return _customButton(
            title: optionList[index]['title'],
            icon: optionList[index]['icon'],
          );
        }),
      ),
    );
  }
}

class _customButton extends StatelessWidget {
  const _customButton({super.key, this.icon = Icons.abc, this.title = 'title'});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstant.borederRadius * 2),
        color: theme.colorScheme.primary
      ),
      padding: EdgeInsets.all(AppConstant.appPadding),
      margin: EdgeInsets.only(right: AppConstant.appPadding),
      child: Row(
        spacing: AppConstant.appPadding / 2,
        children: [
          Icon(icon, size: AppConstant.iconSize),
          Text(title , style: theme.textTheme.bodySmall,),
        ],
      ),
    );
  }
}
