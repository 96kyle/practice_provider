import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:image_search/models/photoModel.dart';

class PixabayClass {
  final baseUrl = 'http://pixabay.com/api/';
  final apiKey = '35252766-0441f9b171775eb8bc234ee25';

  Future<List<PhotoModel>> fetch(String query) async {
    final client = http.Client();

    final response = await http.get(
      Uri.parse('$baseUrl?key=$apiKey&q=$query&image_type=photo'),
    );

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    Iterable hits = jsonResponse['hits'];

    return hits.map((e) => PhotoModel.fromJson(e)).toList();
  }
}
