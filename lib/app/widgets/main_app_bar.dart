import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Function? onBackPress;
  final bool hasIcon;

  const MainAppBar({
    Key? key,
    required this.title,
    this.onBackPress,
    this.hasIcon = true,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(45);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color.fromRGBO(
        2,
        39,
        108,
        1,
      ),
      title: title,
      centerTitle: true,
      leading: onBackPress != null
          ? hasIcon
              ? GestureDetector(
                  onTap: () => onBackPress!(),
                  child: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.white, // add custom icons also
                  ),
                )
              : null
          : null,
    );
  }
}
