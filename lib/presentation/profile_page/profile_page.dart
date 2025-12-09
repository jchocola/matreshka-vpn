import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';
import 'package:matreshka_vpn/presentation/profile_page/widget/profile_card.dart';
import 'package:matreshka_vpn/widget/big_icon.dart';
import 'package:matreshka_vpn/widget/custom_scaffold_bg.dart';
import 'package:matreshka_vpn/widget/setting_listtile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomScaffoldBg(child: buildBody(context)));
  }

  Widget buildBody(context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppConstant.appPadding),
        child: Column(
          children: [
            ProfileCard(),
            Gap(AppConstant.appPadding),
            SettingListtile(
              title: 'Статистика использования',
              subTitle: 'Ваши достижения и трафик',
              icon: AppIcon.statisticIcon,
            ),
            SettingListtile(
              title: 'Мои достижения',
              subTitle: 'Смотрите как вы молодец',
              icon: AppIcon.regardIcon,
            ),
            SettingListtile(
              title: 'Настройка аккаунта',
              subTitle: 'Подписка, данные, параметры',
              icon: AppIcon.accountSettingIcon,
            ),
            SettingListtile(
              title: 'Помощь и поддержка',
              subTitle: 'Ответы на вопросы',
              icon: AppIcon.helpIcon,
            ),

            Divider(),

            BigButton(
              title: 'Выйти из аккаунта',
              bgColor: theme.colorScheme.primary,
              borderColor: theme.colorScheme.primary,
              textColor: theme.cardColor,
            )
          ],
        ),
      ),
    );
  }
}
