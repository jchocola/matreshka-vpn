import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';
import 'package:matreshka_vpn/presentation/profile_page/widget/profile_card.dart';
import 'package:matreshka_vpn/widget/big_icon.dart';
import 'package:matreshka_vpn/widget/custom_app_bar.dart';
import 'package:matreshka_vpn/widget/custom_scaffold_bg.dart';
import 'package:matreshka_vpn/widget/setting_listtile.dart';

class AccountSettingPage extends StatelessWidget {
  const AccountSettingPage({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: 'Настройки аккаунта',
                leading: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(AppIcon.arrowBackIcon),
                ),
              ),
          
              ProfileCard(),
          
              Text('УПРАВЛЕНИЕ АККАУНТОМ', style: theme.textTheme.titleMedium),
          
              SettingListtile(title: 'Управление подпиской', subTitle: 'Премиум до 12.09.2026',),
              SettingListtile(title: 'Личные данные и пароль', subTitle: 'Просмотр и измерение',),
              SettingListtile(title: 'Уведомления', subTitle : 'Настройка уведомлений',),
          
          
              Text('СЕАНС', style: theme.textTheme.titleMedium),
          
              BigButton(
                textColor: theme.colorScheme.primary,
                borderColor:  theme.colorScheme.primary,
                withIcon: true,
                title: 'Выйти из аккаунта',
                icon: AppIcon.logoutIcon,
              ),


              Center(
                child: Column(
                  
                  children: [
                    Text('Version : 1.0.0' , style: theme.textTheme.bodySmall,),
                      Text('@2025 BacDev',style: theme.textTheme.bodySmall )
                  ],
                ),
              ),
            
          
            ],
          ),
        ),
      ),
    );
  }
}
