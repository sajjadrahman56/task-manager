class PhotoModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
 

  PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
 
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
    
    );
  }
}