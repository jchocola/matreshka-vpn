// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';
import 'package:matreshka_vpn/presentation/defence_page/provider/defence_page_provider.dart';
import 'package:matreshka_vpn/presentation/defence_page/widget/defence_app_bar.dart';
import 'package:matreshka_vpn/presentation/defence_page/widget/description_widget.dart';
import 'package:matreshka_vpn/presentation/defence_page/widget/ip_info_widget.dart';
import 'package:matreshka_vpn/widget/advice.dart';
import 'package:matreshka_vpn/widget/big_icon.dart';
import 'package:matreshka_vpn/presentation/defence_page/widget/privacy_on_off.dart';
import 'package:matreshka_vpn/presentation/defence_page/widget/turnOnOffButton.dart';
import 'package:matreshka_vpn/widget/custom_scaffold_bg.dart';
import 'package:matreshka_vpn/widget/picked_server_button.dart';
import 'package:provider/provider.dart';

class DefencePage extends StatelessWidget {
  const DefencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(body: CustomScaffoldBg(child: buildBody(context)));
  }

  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final defensePageProvider_r = context.read<DefencePageProvider>();
    final defensePageProvider_l = context.watch<DefencePageProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppConstant.appPadding),
        child: SingleChildScrollView(
          child: Column(
            spacing: AppConstant.appPadding,
            children: [
              DefenceAppBar(),
              PrivacyOnOff(),
              const Gap(AppConstant.appPadding * 2),
              TurnOnOffbutton(),
              const Gap(AppConstant.appPadding),
              //IpInfoWidget(),
              DescriptionWidget(),
              // PickedServerButton(),
              BigButton(
                title: 'Мне повезет!',
                borderColor: theme.colorScheme.secondary.withOpacity(0.3),
                icon: AppIcon.luckyIcon,
                withIcon: true,
                textColor: theme.colorScheme.secondary,
                bgColor: theme.cardColor,
              ),
              BigButton(
                title: 'Помощь',
                withIcon: true,
                icon: AppIcon.infoIcon,
                borderColor: theme.colorScheme.tertiary.withOpacity(0.3),
              ),

              Advice(
                content:
                    '💡 Совет: Используйте "Мне повезет!" для автоматического выбора лучшего сервера',
              ),

              Column(
                spacing: AppConstant.appPadding,
                children: [
                  Row(
                    spacing: AppConstant.appPadding,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: BigButton(
                          textColor:
                              defensePageProvider_l.isOpenVPNrunning == true
                              ? theme.colorScheme.primary
                              : Colors.black54,
                          bgColor:
                              defensePageProvider_l.isOpenVPNrunning == true
                              ? theme.colorScheme.secondary.withOpacity(0.3)
                              : Colors.transparent,
                          borderColor:
                              defensePageProvider_l.isOpenVPNrunning == true
                              ? theme.colorScheme.secondary.withOpacity(0.3)
                              : Colors.black,
                          title: 'Open VPN',
                          onTap: () async {
                            // STOP CASE
                            if (defensePageProvider_r.isOpenVPNrunning) {
                              await defensePageProvider_r.openVpnDisconnect();
                            } else {
                              // START CASE
                              await defensePageProvider_r.openVpnConnect();
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: BigButton(
                          textColor:
                              defensePageProvider_l.isWireGuardrunning == true
                              ? theme.colorScheme.primary
                              : Colors.black54,
                          bgColor:
                              defensePageProvider_l.isWireGuardrunning == true
                              ? theme.colorScheme.secondary.withOpacity(0.3)
                              : Colors.transparent,
                          borderColor:
                              defensePageProvider_l.isWireGuardrunning == true
                              ? theme.colorScheme.secondary.withOpacity(0.3)
                              : Colors.black, 
                          title: 'WireGuard',
                          onTap: () async {
                            if (defensePageProvider_r.isWireGuardrunning) {
                              // stop case
                              await defensePageProvider_r
                                  .wireguardStopConnect();
                            } else {
                              // connect
                              await defensePageProvider_r.wireguardConnect();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  BigButton(title: 'VLESS'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
