import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dex/constants.dart';

class PokeLink {
  final String name;
  final String url;

  const PokeLink({required this.name, required this.url});

  factory PokeLink.fromJson(Map<String, dynamic> json) {
    return PokeLink(name: json['name'], url: json['url']);
  }
}

class ApiService {
  Future<List<PokeLink>> getPokeList() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.all);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      LinkedHashMap l = jsonDecode(response.body);
      List<PokeLink> i = [];
      for (Map<String, dynamic> e in l['results']) {
        i.add(PokeLink.fromJson(e));
      }
      return i;
    } else {
      return [];
    }
  }
}
