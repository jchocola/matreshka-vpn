import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';
import 'package:matreshka_vpn/presentation/location_page/page/server_info_page/widget/category_widget.dart';
import 'package:matreshka_vpn/presentation/location_page/page/server_info_page/widget/server_info_widget.dart';
import 'package:matreshka_vpn/presentation/location_page/page/server_info_page/widget/speed_statistic_widget.dart';
import 'package:matreshka_vpn/presentation/location_page/page/server_info_page/widget/workload_info_widget.dart';
import 'package:matreshka_vpn/widget/advice.dart';
import 'package:matreshka_vpn/widget/big_icon.dart';
import 'package:matreshka_vpn/widget/custom_app_bar.dart';
import 'package:matreshka_vpn/widget/custom_scaffold_bg.dart';

class ServerInfoPage extends StatelessWidget {
  const ServerInfoPage({super.key});

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
            spacing: AppConstant.appPadding,
            children: [
              CustomAppBar(
                title: 'Детали сервера',
                leading: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(AppIcon.arrowBackIcon),
                ),
              ),

              ServerInfoWidget(),
              SpeedStatisticWidget(),
              WorkloadInfoWidget(),
              CategoryWidget(),

              Row(
                spacing: AppConstant.appPadding,
                children: [
                  Expanded(child: BigButton(
                    icon: AppIcon.arrowBackIcon,
                    withIcon: true,
                    borderColor: theme.colorScheme.tertiary,
                    title: 'Back',
                  )),
                  Expanded(child: BigButton(
                    bgColor: theme.colorScheme.primary,
                    borderColor: theme.colorScheme.primary,
                    title: 'Connect',
                    withIcon: true,
                    icon: AppIcon.fastIcon,
                    textColor: theme.cardColor,
                  )),
                ],
              ),

              Advice(content: 'Совет: Выбирайте серверы с низким пингом для лучшей скорости',)
            ],
          ),
        ),
      ),
    );
  }
}
