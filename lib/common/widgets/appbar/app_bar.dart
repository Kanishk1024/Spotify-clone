import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final SvgPicture? picture;
  const BasicAppBar({super.key, this.picture});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: picture ?? const Text(''),
      elevation: 0,
      iconTheme: const IconThemeData(),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
