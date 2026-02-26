import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Image.asset(
          "assets/images/Group 31.png",
          width: 120,
          height: 120,
          fit: BoxFit.fitHeight,
        ),
      ),
      //toolbarHeight: 200,
    );
  }
}
