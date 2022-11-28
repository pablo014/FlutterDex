import 'package:flutter_dex/pages/display.dart';
import 'package:flutter_dex/pages/home.dart';

import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;

    Widget route;
    switch (name) {
      case '':
        route = const HomePage();
        break;
      case 'display':
        if(args is List) {
          route = Display(id: args[0]);
        } else {
          route = const ErrorRoute();
        }
        break;
      default:
        route = const ErrorRoute();
    }
    return MaterialPageRoute(builder: (_) => DefaultTextStyle(style: const TextStyle(
        color: Colors.white, fontSize: 30, fontFamily: 'Ethnocentric'), child: route));
}
}

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Oops Something Went Wrong');
  }
}
