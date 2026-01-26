// ...existing code...
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matreshka_vpn/data/model/internet_info_model.dart';
import 'package:matreshka_vpn/data/repository/ip_repo_impl.dart';
import 'package:matreshka_vpn/presentation/defence_page/provider/defence_page_provider.dart';
import 'package:provider/provider.dart';

class IpInfoWidget extends StatelessWidget {
  const IpInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final defencePageProvide_l = context.watch<DefencePageProvider>();
    return Column(children: [
        Text(defencePageProvide_l.internetInfoModel?.ip ?? 'empty'),
         Text(defencePageProvide_l.internetInfoModel?.continentCode ?? 'empty')
      ],
    );
  }
}

// ...existing code...
