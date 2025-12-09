import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';
import 'package:matreshka_vpn/widget/note_widget.dart';
import 'package:matreshka_vpn/widget/small_button_with_icon.dart';

class WorkloadInfoWidget extends StatelessWidget {
  const WorkloadInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppConstant.appPadding * 2),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(AppConstant.borederRadius),
        color: theme.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppConstant.appPadding,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  'Загруженность сервера',
                  style: theme.textTheme.titleLarge,
                ),
              ),
              smallButtonWithIcon(
                title: 'Загружено',
                icon: AppIcon.negativeIcon,
              ),
            ],
          ),

          LinearProgressIndicator(value: 0.2 , minHeight: 10,),

          Text('20% пользователей подключено'),

          NoteWidget(note: 'Сервер сильно загружен. Рассмотрите выбор другого сервера для лучшей скорости.',)
        ],
      ),
    );
  }
}
