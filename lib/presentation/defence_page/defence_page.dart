import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';
import 'package:matreshka_vpn/presentation/defence_page/widget/defence_app_bar.dart';
import 'package:matreshka_vpn/presentation/defence_page/widget/description_widget.dart';
import 'package:matreshka_vpn/widget/advice.dart';
import 'package:matreshka_vpn/widget/big_icon.dart';
import 'package:matreshka_vpn/presentation/defence_page/widget/privacy_on_off.dart';
import 'package:matreshka_vpn/presentation/defence_page/widget/turnOnOffButton.dart';
import 'package:matreshka_vpn/widget/custom_app_bar.dart';
import 'package:matreshka_vpn/widget/custom_scaffold_bg.dart';
import 'package:matreshka_vpn/widget/picked_server_button.dart';

class DefencePage extends StatelessWidget {
  const DefencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(body: CustomScaffoldBg(child: buildBody(context)));
  }

  Widget buildBody(context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppConstant.appPadding),
        child: Column(
          spacing: AppConstant.appPadding,
          children: [
            DefenceAppBar(),
            PrivacyOnOff(),
            const Gap(AppConstant.appPadding * 2),
            TurnOnOffbutton(),
            const Gap(AppConstant.appPadding),
            DescriptionWidget(),
            PickedServerButton(),
            BigButton(
              title: 'Мне повезет!',
              borderColor: theme.colorScheme.secondary.withOpacity(0.3),
              icon: AppIcon.luckyIcon,
              withIcon: true,
              textColor: theme.colorScheme.secondary,
              bgColor: theme.cardColor,
            ),
            BigButton(title: 'Помощь',withIcon:  true,icon: AppIcon.infoIcon,borderColor: theme.colorScheme.tertiary.withOpacity(0.3),),


            Advice(content: '💡 Совет: Используйте "Мне повезет!" для автоматического выбора лучшего сервера',)
          ],
        ),
      ),
    );
  }
}
