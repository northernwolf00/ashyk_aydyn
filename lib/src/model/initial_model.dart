class DataItem {
  int id;
  String title;
  String icon;
  List<Subcategory> subcategories;

  DataItem({
    required this.id,
    required this.title,
    required this.icon,
    required this.subcategories,
  });

  factory DataItem.fromJson(Map<String, dynamic> json) => DataItem(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
      subcategories: List<Subcategory>.from(
        json['subcategories'].map((x) => Subcategory.fromJson(x)),
      ));

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'icon': icon,
        'subcategories':
            List<dynamic>.from(subcategories.map((x) => x.toJson())),
      };
}

class Subcategory {
  int id;
  String title;
  String icon;
  int imageTotal;
  int musicTotal;
  int videoTotal;

  Subcategory({
    required this.id,
    required this.title,
    required this.icon,
    required this.imageTotal,
    required this.musicTotal,
    required this.videoTotal,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json['id'],
        title: json['title'],
        icon: json['icon'],
        imageTotal: json['image_total'],
        musicTotal: json['music_total'],
        videoTotal: json['video_total'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'icon': icon,
        'image_total': imageTotal,
        'music_total': musicTotal,
        'video_total': videoTotal,
      };
}
