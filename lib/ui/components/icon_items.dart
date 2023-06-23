import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class IconItems extends StatelessWidget {
  const IconItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const SvgIcon(
            icon: SvgIconData('assets/icons/menu.svg'),
            size: 22,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const SvgIcon(
            icon: SvgIconData(
              'assets/icons/mail.svg',
            ),
            size: 40,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const SvgIcon(
            icon: SvgIconData(
              'assets/icons/bell.svg',
            ),
            size: 25,
          ),
        ),
      ],
    );
  }
}
