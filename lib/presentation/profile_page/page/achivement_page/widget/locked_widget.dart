import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/widget/achivement_card.dart';

class LockedWidget extends StatelessWidget {
  const LockedWidget({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       spacing: AppConstant.appPadding,
       
      children: [
         Text('В ПРОЦЕССЕ', style: theme.textTheme.titleMedium),
          AchivementCard(isLocked: true,),
         AchivementCard(isLocked: true,),
         AchivementCard(isLocked: true,),
      ],
    );
  }
}
