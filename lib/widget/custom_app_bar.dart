import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key , this.title = 'title' , this.leading =const SizedBox()});
  final String title;
  final Widget leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      leading: leading,
      title: Text(title) ,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
