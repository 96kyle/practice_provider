import 'package:flutter/material.dart';
import 'package:image_search/models/photoModel.dart';

class PhotoWidget extends StatelessWidget {
  final PhotoModel photo;

  const PhotoWidget({
    super.key,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(photo.previewURL),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
