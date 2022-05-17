import 'package:flutter/material.dart';

// Views
import 'package:mqtt_monitor/views/home_page.dart';
import 'package:mqtt_monitor/views/not_found.dart';
import 'package:mqtt_monitor/views/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const NotFound()),
      routes: {
        '/': ((context) => const HomePage()),
        '/home': ((context) => const HomePage()),
        '/test': ((context) => const TestPage()),
        '/notfound': ((context) => const NotFound()),
      },
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,

      //debug options

      // debugShowMaterialGrid: true,
      // showPerformanceOverlay: true,
      // checkerboardRasterCacheImages: true,
      // checkerboardOffscreenLayers: true,
      // showSemanticsDebugger: true,
      // debugShowCheckedModeBanner: false,
    );
  }
}
