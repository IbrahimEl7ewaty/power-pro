class Video {
  final String? id;
  final String? title;
  final String? thumbnailUrl;
  //videoUrl
  final String? videoUrl;

  Video({
    this.id,
    this.title,
    this.thumbnailUrl,
    this.videoUrl, // Add videoUrl if needed
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      videoUrl:
          json['videoUrl'] as String? ?? "", // Default to empty string if null
    );
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'title': title, 'thumbnailUrl': thumbnailUrl};
  }
}

class VideoResponse {
  final String status;
  final VideoData data;

  VideoResponse({required this.status, required this.data});

  factory VideoResponse.fromJson(Map<String, dynamic> json) {
    return VideoResponse(
      status: json['status'] as String,
      data: VideoData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'data': data.toJson()};
  }
}

class VideoData {
  final List<Video> allVideos;

  VideoData({required this.allVideos});

  factory VideoData.fromJson(Map<String, dynamic> json) {
    return VideoData(
      allVideos:
          (json['allvideos'] as List<dynamic>)
              .map((e) => Video.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'allvideos': allVideos.map((e) => e.toJson()).toList()};
  }
}


