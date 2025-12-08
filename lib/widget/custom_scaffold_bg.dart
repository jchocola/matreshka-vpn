import 'package:flutter/material.dart';

class CustomScaffoldBg extends StatelessWidget {
  const CustomScaffoldBg({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: AlignmentGeometry.topLeft,
        end: AlignmentGeometry.bottomRight,
          colors: [
            theme.cardColor.withOpacity(0.1),
            theme.colorScheme.secondary.withOpacity(0.1),
            theme.colorScheme.primary.withOpacity(0.1),
            
          ],
        ),
      ),
      child: child,
    );
  }
}
