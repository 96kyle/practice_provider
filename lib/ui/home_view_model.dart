import 'dart:async';

import 'package:image_search/data/api.dart';
import 'package:image_search/models/photoModel.dart';

class HomeViewModel {
  final PixabayClass api;

  HomeViewModel(this.api);

  final _photoStreamController = StreamController<List<PhotoModel>>()..add([]);

  Stream<List<PhotoModel>> get photoStream => _photoStreamController.stream;

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }
}
