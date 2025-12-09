import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstant.appPadding),
        child: Row(
          spacing: AppConstant.appPadding,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(AppConstant.appPadding / 3),

              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
                radius: size.width * 0.13,
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Уютная Матрешка', style: theme.textTheme.titleLarge),
                Text('user@gmail.com', style: theme.textTheme.bodyMedium),

                Gap(AppConstant.appPadding*2),
                Container(
                  padding: EdgeInsets.all(AppConstant.appPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppConstant.borederRadius,
                    ),
                    color: theme.colorScheme.primary,
                  ),
                  child: Text('Премиум до 13.04.2025' , style: theme.textTheme.titleMedium!.copyWith(color: theme.cardColor),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
