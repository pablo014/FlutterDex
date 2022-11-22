import 'package:flutter/material.dart';
import 'package:flutter_dex/api/api_service.dart';

class Display extends StatefulWidget {
  final String id;
  const Display({Key? key, required this.id}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  late Future<Species> s;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    s = ApiService().getSpecies(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Species>(
      future: s,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.name);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
