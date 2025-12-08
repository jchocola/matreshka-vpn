import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [Text('Включить защиту', style: theme.textTheme.titleMedium,), Text('Нажмите для активации защиты', style: theme.textTheme.bodySmall,)],
    );
  }
}
