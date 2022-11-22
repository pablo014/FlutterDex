import 'package:flutter_dex/pages/display.dart';
import 'package:flutter_dex/pages/home.dart';

import 'main.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;
    switch (name) {
      case '':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case 'display':
        if(args is List) {
          return MaterialPageRoute(builder: (_) => Display(id: args[0]));
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
