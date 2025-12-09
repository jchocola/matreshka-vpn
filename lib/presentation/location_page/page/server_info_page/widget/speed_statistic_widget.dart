import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/core/icon/app_icon.dart';
import 'package:matreshka_vpn/widget/note_widget.dart';
import 'package:matreshka_vpn/widget/speed_info_card.dart';

class SpeedStatisticWidget extends StatelessWidget {
  const SpeedStatisticWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
          Text('Показатели скорости', style: theme.textTheme.titleLarge),

          Row(
            children: [
              Expanded(
                flex: 1,
                child: SpeedInfoCard(icon: AppIcon.fastIcon, value: '28' , speed: 'ms',status: 'Good',containerColor: theme.colorScheme.primary.withOpacity(0.1),),
              ),
              Expanded(
                flex: 1,
                child: SpeedInfoCard(icon: AppIcon.downloadIcon, value: '920' , speed: 'Mb/s', status: 'Download', textColor: theme.colorScheme.primary,),
              ),
              Expanded(
                flex: 1,
                child: SpeedInfoCard(icon: AppIcon.uploadIcon, value: '880' , speed: 'Mb/s', status: 'Upload',),
              ),
            ],
          ),


          NoteWidget(note: 'Совет: Для потокового видео рекомендуется скорость загрузки не менее 25 Мбит/с',)
        ],
      ),
    );
  }
}
