import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search/data/api.dart';
import 'package:image_search/models/photoModel.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayClass api;
  final _photoStreamController = StreamController<List<PhotoModel>>()..add([]);

  Stream<List<PhotoModel>> get photoStream => _photoStreamController.stream;

  PhotoProvider({
    Key? key,
    required Widget child,
    required this.api,
  }) : super(key: key, child: child);

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayClass found in context');

    return result!;
  }

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}
