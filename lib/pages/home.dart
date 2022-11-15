import 'package:flutter/material.dart';
import 'package:flutter_dex/components/list_item.dart';

import '../api/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<PokeLink>> pokeList;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    pokeList = ApiService().getPokeList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokeLink>>(
      future: pokeList,
        builder: (context, snapshot) {
        if(snapshot.hasData) {
          return ListView(
            children: [
              for (var item in snapshot.data!)
                ListItem(item)
            ],
          );
        }
        else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
        });
  }
}
