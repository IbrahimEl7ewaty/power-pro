class Video1 {
  final String id;
  final String title;
  final String videoUrl;
  final String thumbnailUrl;

  Video1({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.thumbnailUrl,
  });

  factory Video1.fromJson(Map<String, dynamic> json) {
    return Video1(
      id: json['_id'],
      title: json['title'],
      videoUrl: json['videoUrl'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'videoUrl': videoUrl,
      'thumbnailUrl': thumbnailUrl,
    };
  }
}
