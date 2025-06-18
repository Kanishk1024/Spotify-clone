import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool isSignOut;

  const BasicAppBar({super.key, this.title, this.isSignOut = false});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: title ?? const Text(''),
      elevation: 0,
      iconTheme: const IconThemeData(),
      centerTitle: true,
      actions: [
        if (isSignOut == true)
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout_rounded),
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
