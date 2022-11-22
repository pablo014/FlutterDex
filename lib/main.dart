import 'package:flutter/material.dart';
import 'package:flutter_dex/pages/home.dart';
import 'package:flutter_dex/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Library',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DefaultTextStyle(
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontFamily: 'Ethnocentric'),
        child: HomePage(),
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
