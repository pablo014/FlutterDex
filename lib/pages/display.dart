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
    return SafeArea(
      child: FutureBuilder<Species>(
        future: s,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child:
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.chevron_left, color: Colors.white, size: 50,)
                        ),
                      ),
                      Text(snapshot.data!.name, style: const TextStyle(fontSize: 35),),
                      Image.network(snapshot.data!.image),
                      Text(snapshot.data!.flavorText)
                    ],
                  ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
