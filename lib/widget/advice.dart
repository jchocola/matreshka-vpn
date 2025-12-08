import 'package:flutter/material.dart';

class Advice extends StatelessWidget {
  const Advice({super.key , this.content = 'Advice'});
  final String content;
  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    return Text(content , style: theme.textTheme.bodySmall,textAlign: TextAlign.center,);
  }
}
