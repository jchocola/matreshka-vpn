import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/widget/big_icon.dart';
import 'package:matreshka_vpn/widget/custom_scaffold_bg.dart';
import 'package:matreshka_vpn/widget/custom_textfield.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int index = 1;

  void changeIndex({required int i}) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: CustomScaffoldBg(child: buildBody(context)),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final imageSize = MediaQuery.of(context).size.width * 0.4;
    return Padding(
      padding: const EdgeInsets.all(AppConstant.appPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(
                  AppConstant.borederRadius,
                ),
                child: Image.asset(
                  'assets/main.png',
                  height: imageSize,
                  width: imageSize,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Text('Matreska VPN', style: theme.textTheme.titleLarge),
          Text('Простая защита для каждого', style: theme.textTheme.bodySmall),

          Gap(AppConstant.appPadding * 3),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: AppConstant.appPadding,
                children: [
                  CupertinoSlidingSegmentedControl(
                    groupValue: index,
                    children: {1: Text('Sign In'), 2: Text('Sign Up')},
                    onValueChanged: (value) {
                      changeIndex(i: value!);
                    },
                  ),
                  CustomTextfield(),
                  CustomTextfield(),
                  index == 2 ? CustomTextfield() : SizedBox(),
                  Divider(),
                  BigButton(
                    title: 'Sign In',
                    bgColor: theme.colorScheme.primary,
                    borderColor: theme.colorScheme.primary,
                    textColor: theme.cardColor,
                    onTap: () {
                      context.go('/defence_page');
                    },
                  ),
                  Image.asset(
                    'assets/google.png',
                    width: AppConstant.iconSize * 1.5,
                    height: AppConstant.iconSize * 1.5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
