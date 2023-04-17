import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/pixabay_api.dart';

void main() {
  test('pixabay data get success', () async {
    final api = PixabayApi();

    final result = await api.fetch('apple');

    expect(result.first.id, 634572);
  });
}
