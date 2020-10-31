import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  final bool showDivider;
  DrawerMenu({
    this.title = 'Menu',
    this.icon = Icons.home,
    this.showDivider = false,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Text(title),
          trailing: Icon(icon),
        ),
        if (showDivider) Divider(),
      ],
    );
  }
}
