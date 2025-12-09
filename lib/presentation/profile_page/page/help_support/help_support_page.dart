import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';
import 'package:matreshka_vpn/widget/advice.dart';
import 'package:matreshka_vpn/widget/big_icon.dart';
import 'package:matreshka_vpn/widget/custom_app_bar.dart';
import 'package:matreshka_vpn/widget/custom_expantion_tile.dart';
import 'package:matreshka_vpn/widget/custom_scaffold_bg.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomScaffoldBg(child: buildBody(context)));
  }

  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppConstant.appPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppConstant.appPadding,
            children: [
              CustomAppBar(
                title: 'Помощь и поддержка',
                leading: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(AppIcon.arrowBackIcon),
                ),
              ),

              Text(
                'Мы здесь, чтобы помочь вам! 🤝',
                style: theme.textTheme.bodyMedium,
              ),

              Row(
                spacing: AppConstant.appPadding,
                children: [
                  Expanded(
                    child: BigButton(
                      bgColor: theme.colorScheme.primary,
                      borderColor: theme.colorScheme.primary,
                      title: 'Questions',
                      withIcon: true,
                      icon: AppIcon.questionIcon,
                      textColor: theme.cardColor,
                    ),
                  ),
                  Expanded(
                    child: BigButton(
                      icon: AppIcon.feedbackIcon,
                      withIcon: true,
                      borderColor: theme.colorScheme.tertiary,
                      title: 'Feedback',
                    ),
                  ),
                ],
              ),

              Text(
                'Часто задаваемые вопросы',
                style: theme.textTheme.titleMedium,
              ),

              CustomExpantionTile(
                title: "Как узнать, что я защищён?",
                subtitle:
                    "Когда матрешка на главном экране просыпается и светится, значит, ваше соединение защищено! Также статус 'Вы под защитой!' будет отображаться сверху.",
              ),
              CustomExpantionTile(
                title: "Мой VPN не подключается. Что делать?",
                subtitle:
                    "Попробуйте выбрать другой сервер из списка 'Быстрые' или 'Ближайшие'. Если проблема не исчезнет, свяжитесь с нашей поддержкой.",
              ),
              CustomExpantionTile(
                title: "Работает ли Matreshka VPN на всех моих устройствах?",
                subtitle:
                    "Да, с Премиум-подпиской вы можете защитить до 5 устройств одновременно: телефон, планшет, или компьютер.",
              ),
              CustomExpantionTile(
                title: "Что такое Пинг (Ping) и почему он важен?",
                subtitle:
                    "Пинг — это скорость, с которой данные доходят до сервера и возвращаются обратно. Чем меньше число, тем быстрее отклик. Для игр и видео лучше выбирать серверы с минимальным Пингом.",
              ),

              Advice(content: "Свяжитесь с нашей командой поддержки через чат или электронную почту.",),

              Advice(content: 'Выбирайте серверы из категории "Ближайшие" для максимальной скорости!',)
            ],
          ),
        ),
      ),
    );
  }
}
