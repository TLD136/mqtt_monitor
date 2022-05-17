import 'dart:io';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

Widget appDrawer(context) {
  return Drawer(
    child: Column(children: [
      ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 87, 179, 255),
            ),
            child: Text("Header"),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
          ListTile(
            title: const Text('Test page'),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/test");
            },
          ),
          ListTile(
            title: const Text('Not Found'),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/notfound");
            },
          ),
        ],
      ),
      const Spacer(),
      // De onderste elementen
      ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          const Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            title: const Text('Exit'),
            onTap: () {
              // op android ziet `exit(0)` eruit alsof het crasht
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else {
                exit(0);
              }
            },
          ),
        ],
      )
    ]),
  );
}
