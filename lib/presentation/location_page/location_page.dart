import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';
import 'package:matreshka_vpn/presentation/location_page/widget/selector_widget.dart';
import 'package:matreshka_vpn/widget/custom_scaffold_bg.dart';
import 'package:matreshka_vpn/widget/custom_textfiled.dart';
import 'package:matreshka_vpn/widget/server_info_card.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(body: CustomScaffoldBg(child: buildBody(context))),
    );
  }

  Widget buildBody(context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Выбери место', style: theme.textTheme.titleLarge),
          pinned: true,

          stretch: true,

          backgroundColor: theme.cardColor,
          surfaceTintColor: theme.cardColor,
        ),

        SliverToBoxAdapter(
          child: Container(
            color: theme.cardColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstant.appPadding,
              ),
              child: CustomTextfiled(
                icon: AppIcon.searchIcon,
                hintText: 'Поиск страны или города ...',
              ),
            ),
          ),
        ),

        SliverAppBar(
          backgroundColor: theme.cardColor,
          surfaceTintColor: theme.cardColor,
          pinned: true,
          toolbarHeight: 45,
          flexibleSpace: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstant.appPadding),
            child: Center(
              child: Column(children: [Divider(), SelectorWidget(), Divider()]),
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 5,
            (context, index) => ServerInfoCard(
              onTap: () {
                context.push('/location_page/server_page');
              },
            ),
          ),
        ),
      ],
    );
  }
}
