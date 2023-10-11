class DataNewVideos {
  int id;
  String title;
  String image;
  String fileUrl;
  String downloaded;
  int preview;
  String size;
  String fileType;
  String description;
  dynamic wordAuthor;
  dynamic soundAuthor;

  DataNewVideos({
    required this.id,
    required this.title,
    required this.image,
    required this.fileUrl,
    required this.downloaded,
    required this.preview,
    required this.size,
    required this.fileType,
    required this.description,
    this.wordAuthor,
    this.soundAuthor,
  });

  factory DataNewVideos.fromJson(Map<String, dynamic> json) {
    return DataNewVideos(
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
