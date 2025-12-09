import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';

class CustomTextfiled extends StatelessWidget {
  const CustomTextfiled({super.key, this.icon = Icons.search , this.hintText = 'Label Text'});
  final IconData icon;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon , color: theme.colorScheme.tertiary.withOpacity(0.5),),
        hintText: hintText,
        
      focusedBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(AppConstant.borederRadius),
       borderSide: BorderSide(
            color: theme.colorScheme.primary.withOpacity(0.8),
            width: 2
          ) 
      ),

      enabledBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(AppConstant.borederRadius),
       borderSide: BorderSide(
            color: theme.colorScheme.tertiary.withOpacity(0.5)
          ) 
      ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstant.borederRadius),
          borderSide: BorderSide(
            color: theme.colorScheme.tertiary.withOpacity(0.5)
          )
        ),
      ),
    );
  }
}
