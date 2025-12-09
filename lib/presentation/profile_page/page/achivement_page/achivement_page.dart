import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';
import 'package:matreshka_vpn/presentation/profile_page/page/achivement_page/widget/achivement_progress_widget.dart';
import 'package:matreshka_vpn/presentation/profile_page/page/achivement_page/widget/custom_note.dart';
import 'package:matreshka_vpn/presentation/profile_page/page/achivement_page/widget/locked_widget.dart';
import 'package:matreshka_vpn/presentation/profile_page/page/achivement_page/widget/unlocked_widget.dart';
import 'package:matreshka_vpn/widget/custom_app_bar.dart';

import 'package:matreshka_vpn/widget/custom_scaffold_bg.dart';

class AchivementPage extends StatelessWidget {
  const AchivementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomScaffoldBg(child: buildBody(context)));
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppConstant.appPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppConstant.appPadding,
            children: [
                CustomAppBar(
                      title: 'Мои достижения',
                      leading: IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(AppIcon.arrowBackIcon),
                      ),
                    ),
          
          
                    AchivementProgressWidget(),
                    UnlockedWidget(),
                    LockedWidget(),
                    CustomNote()
          
            ],
          ),
        ),
      ),
    );
  }
}
