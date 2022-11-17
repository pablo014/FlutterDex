import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  final String id;
  const Display({Key? key, required this.id}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.id);
  }
}
