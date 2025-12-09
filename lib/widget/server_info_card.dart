import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';
import 'package:matreshka_vpn/widget/small_button_with_icon.dart';

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
        smallButtonWithIcon(title: 'Быстро', icon: AppIcon.fastIcon),
        smallButtonWithIcon(title: '45%', icon: AppIcon.usersIcon, containerColor: theme.colorScheme.tertiary.withOpacity(0.1)),
        smallButtonWithIcon(title: '120ms', icon: AppIcon.signalIcon ,textColor: theme.colorScheme.primary,),
      ],
    );
  }
}

