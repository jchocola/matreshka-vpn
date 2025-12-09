import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';

class CustomNote extends StatelessWidget {
  const CustomNote({super.key});

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
      child: Column(
        spacing: AppConstant.appPadding,
        children: [
          Text('Продолжай использовать Matreshka VPN и разблокируй все достижения!', textAlign: TextAlign.center,style: theme.textTheme.titleMedium,),
          Text('Каждое использование приносит тебя ближе к новым наградам', textAlign: TextAlign.center,style: theme.textTheme.bodySmall )
        ],
      ),
    );
  }
}
