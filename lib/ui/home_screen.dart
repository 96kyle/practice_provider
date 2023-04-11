import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart%20';
import 'package:image_search/models/photoModel.dart';
import 'package:image_search/ui/widgets/photo_widget.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotoModel> _photos = [];

  final _controller = TextEditingController();

  Future<List<PhotoModel>> fetch(String query) async {
    final client = http.Client();

    final queryParameters = {
      'key': '35252766-0441f9b171775eb8bc234ee25',
      'q': query,
    };

    final response = await client.get(
      Uri.https('https://pixabay.com/', 'api/', queryParameters),
    );

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    Iterable hits = jsonResponse['hits'];

    return hits.map((e) => PhotoModel.fromJson(e)).toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('이미지 검색 앱'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    final photos = await fetch(_controller.text);
                    setState(() {
                      _photos.addAll(photos);
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) =>
                  PhotoWidget(photo: _photos[index]),
            ),
          ),
        ],
      ),
    );
  }
}
