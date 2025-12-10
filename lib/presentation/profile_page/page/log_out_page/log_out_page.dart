import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/widget/advice.dart';
import 'package:matreshka_vpn/widget/big_icon.dart';
import 'package:matreshka_vpn/widget/note_widget.dart';

class LogOutPage extends StatelessWidget {
  const LogOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(AppConstant.blurRadius * 3),

        // style: BorderStyle.solid,
        // color: theme.colorScheme.primary
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Вы уверены?', style: theme.textTheme.titleMedium),
          Text(
            'Вы собираетесь выйти из своей учетной записи. Вы сможете снова войти в любой момент.',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
      content: Padding(
        padding: const EdgeInsets.all(AppConstant.appPadding),
        child: Column(
          spacing: AppConstant.appPadding,
          mainAxisSize: MainAxisSize.min,
          children: [
            BigButton(
              onTap: () {
                context.go('/onboarding');
              },
              title: 'Да, Выйти',
              bgColor: theme.colorScheme.primary,
              borderColor: theme.colorScheme.primary,
              textColor: theme.cardColor,
            ),
            BigButton(
              title: 'Отмена',
              borderColor: theme.colorScheme.primary,
              textColor: theme.colorScheme.primary,
            ),
            Divider(),
            Advice(
              content:
                  ' Совет: Вы можете войти обратно в любой момент, используя свой адрес электронной почты и пароль.',
            ),
          ],
        ),
      ),
    );
  }
}
