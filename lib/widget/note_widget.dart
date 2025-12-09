import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, this.note = 'Note'});
  final String note;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
     padding: EdgeInsets.all(AppConstant.appPadding ),
      decoration: BoxDecoration(
       // border: Border.all(color: theme.colorScheme.primary.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(AppConstant.borederRadius),
        color: theme.colorScheme.tertiary.withOpacity(0.1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppConstant.appPadding,
        children: [
          Text(AppIcon.russiaIcon),
          Flexible(child: Text(note, style: theme.textTheme.bodySmall)),
        ],
      ),
    );
  }
}
