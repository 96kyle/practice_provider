class PhotoModel {
  final int id;
  final String pageURL;
  final String type;
  final String tags;
  final String previewURL;
  final int previewWidth;
  final int previewHeight;
  final String webformatURL;
  final int webformatWidth;
  final int webformatHeight;
  final String largeImageURL;
  final String? fullHDURL;
  final String? imageURL;
  final int imageWidth;
  final int imageHeight;
  final int imageSize;
  final int views;
  final int downloads;
  final int likes;
  final int comments;
  final int user_id;
  final String user;
  final String? userImageURL;

  PhotoModel({
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.previewURL,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatURL,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.largeImageURL,
    this.fullHDURL,
    this.imageURL,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.likes,
    required this.comments,
    required this.user_id,
    required this.user,
    this.userImageURL,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      pageURL: json['pageURL'],
      type: json['type'],
      tags: json['tags'],
      previewURL: json['previewURL'],
      previewWidth: json['previewWidth'],
      previewHeight: json['previewHeight'],
      webformatURL: json['webformatURL'],
      webformatWidth: json['webformatWidth'],
      webformatHeight: json['webformatHeight'],
      largeImageURL: json['largeImageURL'],
      fullHDURL: json['fullHDURL'],
      imageURL: json['imageURL'],
      imageWidth: json['imageWidth'],
      imageHeight: json['imageHeight'],
      imageSize: json['imageSize'],
      views: json['views'],
      downloads: json['downloads'],
      likes: json['likes'],
      comments: json['comments'],
      user_id: json['user_id'],
      user: json['user'],
      userImageURL: json['userImageURL'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pageURL': pageURL,
      'type': type,
      'tags': tags,
      'previewURL': previewURL,
      'previewWidth': previewWidth,
      'previewHeight': previewHeight,
      'webformatURL': webformatURL,
      'webformatWidth': webformatWidth,
      'webformatHeight': webformatHeight,
      'largeImageURL': largeImageURL,
      'fullHDURL': fullHDURL,
      'imageURL': imageURL,
      'imageWidth': imageWidth,
      'imageHeight': imageHeight,
      'imageSize': imageSize,
      'views': views,
      'downloads': downloads,
      'likes': likes,
      'comments': comments,
      'user_id': user_id,
      'user': user,
      'userImageURL': userImageURL,
    };
  }
}
