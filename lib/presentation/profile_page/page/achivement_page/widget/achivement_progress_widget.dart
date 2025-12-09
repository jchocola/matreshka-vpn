import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';

class AchivementProgressWidget extends StatelessWidget {
  const AchivementProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);  
    return Container(
      padding: EdgeInsets.all(AppConstant.appPadding * 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstant.borederRadius),
        color: theme.colorScheme.primary
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppConstant.appPadding,
        children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Прогресс достижений' , style: theme.textTheme.titleMedium!.copyWith(
                  color: theme.cardColor
                ),),
                Text('50%' , style: theme.textTheme.headlineSmall!.copyWith(
                  color: theme.cardColor
                )),
              ],
            ),


            LinearProgressIndicator(
              minHeight: AppConstant.linearProgressHeight,
              value: 0.6,
              backgroundColor: theme.cardColor.withOpacity(0.3),
              color: theme.cardColor,
            ),


            Text("3 из 6 достижений разблокировано" , style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.cardColor
                ))
        ],
      ),
    );
  }
}
