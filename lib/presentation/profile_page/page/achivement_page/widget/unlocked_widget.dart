import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/presentation/profile_page/page/achivement_page/achivement_page.dart';
import 'package:matreshka_vpn/widget/achivement_card.dart';

class UnlockedWidget extends StatelessWidget {
  const UnlockedWidget({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppConstant.appPadding,
      children: [
         Text('РАЗБЛОКИРОВАНО', style: theme.textTheme.titleMedium),
         AchivementCard(),
         AchivementCard(),
         AchivementCard(),
      ],
    );
  }
}
