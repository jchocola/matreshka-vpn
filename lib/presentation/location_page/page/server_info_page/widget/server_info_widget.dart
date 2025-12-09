import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';
import 'package:matreshka_vpn/widget/server_info_card.dart';
import 'package:matreshka_vpn/widget/small_button_with_icon.dart';

class ServerInfoWidget extends StatelessWidget {
  const ServerInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(AppConstant.appPadding * 2),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.secondary),
        borderRadius: BorderRadius.circular(AppConstant.borederRadius),
        color: theme.colorScheme.secondary.withOpacity(0.1),
      ),
      child: Row(
        spacing: AppConstant.appPadding,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppIcon.russiaIcon,
            style: theme.textTheme.titleSmall!.copyWith(
              fontSize: AppConstant.bigIcon,
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
                Text('Russia', style: theme.textTheme.titleLarge),
                Text('Moscow', style: theme.textTheme.bodySmall),

                smallButtonWithIcon(title: 'Очень быстро',icon: AppIcon.fastIcon,)
              ],
            ),
          ),

          IconButton(onPressed: () {}, icon: Icon(AppIcon.favouriteIcn ,color: theme.colorScheme.tertiary,)),
        ],
      ),
    );
  }
}
