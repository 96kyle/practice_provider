import 'package:image_search/models/photoModel.dart';

abstract class PhotoApiRepository {
  Future<List<PhotoModel>> fetch(String query);
}
