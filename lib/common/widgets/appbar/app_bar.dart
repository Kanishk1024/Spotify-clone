import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final SvgPicture? picture;
  final bool isSignOut;
  const BasicAppBar({super.key, this.picture, this.isSignOut = false});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: picture ?? const Text(''),
      elevation: 0,
      iconTheme: const IconThemeData(),
      centerTitle: true,
      actions: [
        if (isSignOut == true)
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Text('Sign Out'),
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
