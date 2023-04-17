import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/data/pixabay_api.dart';
import 'package:image_search/models/photoModel.dart';
import 'package:image_search/ui/home_view_model.dart';

void main() {
  test('Stream이 잘 동작 해야한다', () async {
    final viewModel = HomeViewModel(PixabayApi());

    await viewModel.fetch('apple');
    await viewModel.fetch('apple');

    expect(
      viewModel.photoStream,
      emitsInOrder([
        isA<List<PhotoModel>>(),
        isA<List<PhotoModel>>(),
      ]),
    );
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<List<PhotoModel>> fetch(String query) async {
    Future.delayed(const Duration(microseconds: 500));

    return [];
  }
}
