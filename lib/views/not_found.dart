import 'package:flutter/material.dart';

import 'package:mqtt_monitor/widgets/app_bar.dart';
import 'package:mqtt_monitor/widgets/drawer.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        drawer: appDrawer(context),
        body: Column(
          children: [
            const Text("page not found"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/home");
                },
                child: const Text("Ga terug naar de home page"))
          ],
        ));
  }
}
