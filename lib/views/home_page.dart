import 'package:flutter/material.dart';

import 'package:mqtt_monitor/widgets/app_bar.dart';
import 'package:mqtt_monitor/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      drawer: appDrawer(context),
      body: Card(
        child: Center(
          child: Column(children: const [
            Text("Welkom"),
            Text("Dit is een mqtt monitor geschreven in flutter")
          ]),
        ),
      ),
    );
  }
}
