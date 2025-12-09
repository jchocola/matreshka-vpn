import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';

class ServerInfoCard extends StatelessWidget {
  const ServerInfoCard({super.key ,this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppConstant.appPadding),
        child: Card(
          child: Padding(
          
            padding: const EdgeInsets.all(AppConstant.appPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppConstant.appPadding,
              children: [
                Text(AppIcon.russiaIcon, style: theme.textTheme.titleLarge),
                Expanded(
                  child: Column(
                    spacing: AppConstant.appPadding,
                    children: [
                      //name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Россия', style: theme.textTheme.titleLarge),
                              Text('Moscow', style: theme.textTheme.bodySmall),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(AppIcon.favouriteIcn , size: AppConstant.bigIcon/3, color: theme.colorScheme.tertiary,),
                          ),
                        ],
                      ),
                      buildThreeInfoWidget(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildThreeInfoWidget(context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _customInfo(title: 'Быстро', icon: AppIcon.fastIcon),
        _customInfo(title: '45%', icon: AppIcon.usersIcon, containerColor: theme.colorScheme.tertiary.withOpacity(0.1)),
        _customInfo(title: '120ms', icon: AppIcon.signalIcon ,textColor: theme.colorScheme.primary,),
      ],
    );
  }
}

class _customInfo extends StatelessWidget {
  const _customInfo({
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
