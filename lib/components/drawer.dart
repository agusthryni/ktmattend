import 'package:flutter/material.dart';

import 'my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOutTap;
  const MyDrawer({
    super.key,
    required this.onProfileTap,
    required this.onSignOutTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            // header
            const DrawerHeader(
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 64,
              ),
            ),
            // dashboard list title
            MyListTile(
              icon: Icons.dashboard,
              text: 'D A S H B O A R D',
              onTap: () => Navigator.pop(context),
            ),
            // profile list title
            MyListTile(
              icon: Icons.person,
              text: 'P R O F I L E',
              onTap: onProfileTap,
            ),
          ],
        ),
        // logout list tittle
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: MyListTile(
            icon: Icons.logout,
            text: 'L O G O U T',
            onTap: onSignOutTap,
          ),
        ),
      ]),
    );
  }
}
