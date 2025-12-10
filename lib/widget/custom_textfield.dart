import 'package:flutter/material.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key , this.label = 'Label'});
  final String label;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      decoration: InputDecoration(

        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstant.borederRadius),
          borderSide: BorderSide(color: theme.colorScheme.tertiary),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstant.borederRadius),
        ),
      ),
    );
  }
}
