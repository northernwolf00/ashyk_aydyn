class FileModel {
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

  FileModel({
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

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
      id: json['id'] ?? 0,
      title: json['title'],
      image: json['image'] ?? "",
      fileUrl: json['file_url'],
      downloaded: json['downloaded'],
      preview: json['preview'],
      size: json['size'],
      fileType: json['filetype'],
      description: json['description'] ?? "",
      wordAuthor: json['word_author'],
      soundAuthor: json['sound_author'],
    );
  }
}
