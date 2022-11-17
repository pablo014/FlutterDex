import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dex/constants.dart';

class PokeLink {
  final String name;
  final String url;
  final String id;

  const PokeLink({required this.name, required this.url, required this.id});

  factory PokeLink.fromJson(Map<String, dynamic> json) {
    String url = json['url'].toString();
    String id = url.substring(url.indexOf('pokemon/'));
    return PokeLink(name: json['name'], url: json['url'], id: id);
  }
}

class Species {
  final String name;
  final String image;
  final String flavorText;

  const Species({required this.name, required this.image, required this.flavorText});

  factory Species.fromJson(LinkedHashMap<String, dynamic> sJson, LinkedHashMap<String, dynamic> bJson) {
    //flavor text filter by language 'en'
    String flavorText = sJson['flavor_text_entries'].firstWhere((element) => element['language']['name'] == 'en');
    return Species(name: sJson['name'], image: bJson['sprites']['official-artwork']['front_default'], flavorText: flavorText);
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
  Future<Species> getSpecies(String id) async {
    var url = Uri.parse(ApiConstants.species + id);
    var burl = Uri.parse('${ApiConstants.baseUrl}/$id');
    var sResponse = await http.get(url);
    var bResponse = await http.get(burl);
    if (sResponse.statusCode == 200 && bResponse.statusCode == 200) {
      LinkedHashMap<String, dynamic> s = jsonDecode(sResponse.body);
      LinkedHashMap<String, dynamic> b = jsonDecode(bResponse.body);
      return Species.fromJson(s, b);
    } else {
      return const Species(name: 'name', image: 'image', flavorText: 'flavorText');
    }
  }
}
