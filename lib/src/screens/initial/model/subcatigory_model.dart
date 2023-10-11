class SubcatogoryModel {
  final int id;
  final String title;
  final String icon;
  final String description;
  final List<dynamic> images;
  final List<dynamic> musics;
  final List<VideoItem> videos;

  SubcatogoryModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.description,
    required this.images,
    required this.musics,
    required this.videos,
  });

  factory SubcatogoryModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> images = json['images'];
    final List<dynamic> musics = json['musics'];
    final List<dynamic> videos = json['videos'];

    final List<VideoItem> videoItems =
        videos.map((item) => VideoItem.fromJson(item)).toList();

    return SubcatogoryModel(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
      description: json['description'],
      images: images,
      musics: musics,
      videos: videoItems,
    );
  }
}

class VideoItem {
  final int id;
  final String title;
  final String image;
  final String fileUrl;
  final String downloaded;
  final int preview;
  final String size;
  final String fileType;
  final String description;
  final dynamic wordAuthor;
  final dynamic soundAuthor;

  VideoItem({
    required this.id,
    required this.title,
    required this.image,
    required this.fileUrl,
    required this.downloaded,
    required this.preview,
    required this.size,
    required this.fileType,
    required this.description,
    required this.wordAuthor,
    required this.soundAuthor,
  });

  factory VideoItem.fromJson(Map<String, dynamic> json) {
    return VideoItem(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      fileUrl: json['file_url'],
      downloaded: json['downloaded'],
      preview: json['preview'],
      size: json['size'],
      fileType: json['filetype'],
      description: json['description'],
      wordAuthor: json['word_author'],
      soundAuthor: json['sound_author'],
    );
  }
}
