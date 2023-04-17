import 'dart:async';

import 'package:image_search/data/pixabay_api.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/models/photoModel.dart';

class HomeViewModel {
  final PhotoApiRepository repository;

  HomeViewModel(this.repository);

  final _photoStreamController = StreamController<List<PhotoModel>>()..add([]);

  Stream<List<PhotoModel>> get photoStream => _photoStreamController.stream;

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photoStreamController.add(result);
  }
}
