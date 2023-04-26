import 'dart:io';

import 'package:flutter/material.dart';
import 'package:viper_flutter_example/modules/home/view/home_view.dart';

import 'di/inject_dependencies.dart' as get_it;

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await (get_it.init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter VIPER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
