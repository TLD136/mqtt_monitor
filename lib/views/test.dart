import 'package:flutter/material.dart';

//// voor mqtt
import 'dart:async';
import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import 'package:mqtt_monitor/secrets.dart';

////

// Widgets
import 'package:mqtt_monitor/widgets/app_bar.dart';
import 'package:mqtt_monitor/widgets/drawer.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      drawer: appDrawer(context),
      body: const MqttPeek(),
    );
  }
}

class MqttPeek extends StatefulWidget {
  const MqttPeek({Key? key}) : super(key: key);

  @override
  State<MqttPeek> createState() => _MqttPeekState();
}

class _MqttPeekState extends State<MqttPeek> {
  @override
  Widget build(BuildContext context) {
    final client = MqttServerClient(HOST, IDENTIFIER);
    client.setProtocolV311();
    client.onDisconnected = () {
      print("mqtt is ded.");
    };
    client.onConnected = () {
      print("Connected to server");
      client.subscribe("test", MqttQos.exactlyOnce);
    };

    client.onSubscribed = (topic) {
      print("just subscribed to topic: $topic");
    };
    client.pongCallback = () {
      print("pong?");
    };

    return Scaffold(
      body: Card(
        margin: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      try {
                        await client.connect();
                      } on NoConnectionException catch (e) {
                        // Raised by the client when connection fails.
                        print('client exception - $e');
                        client.disconnect();
                      } on SocketException catch (e) {
                        // Raised by the socket layer
                        print('socket exception - $e');
                        client.disconnect();
                      }
                    },
                    child: const Text("connect"))
              ],
            ),
            Column(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
