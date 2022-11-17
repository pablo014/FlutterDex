import 'package:flutter_dex/pages/display.dart';
import 'package:flutter_dex/pages/home.dart';

import 'main.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (args) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/display':
        if(args is String) {
          return MaterialPageRoute(builder: (_) => Display(id: args));
        } else {
          return MaterialPageRoute(builder: (_) => const ErrorRoute());
        }
      default:
        return MaterialPageRoute(builder: (_) => const ErrorRoute());
    }
}
}

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Oops Something Went Wrong');
  }
}
