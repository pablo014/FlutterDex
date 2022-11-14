import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dex/constants.dart';

class PokeLink {
  final String name;
  final String url;

  const PokeLink({required this.name, required this.url});
}

class ApiService {
  Future<List<PokeLink>> getPokeList() async {
      var url = Uri.https(ApiConstants.baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Iterable l = jsonDecode(response.body);
        List<PokeLink> i = [];
        for (var e in l) {
          i.add(PokeLink(name: e['name'], url: e['url']));
        }
        return i;
      } else {
        return [];
      }
}
}