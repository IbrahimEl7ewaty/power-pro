class ResponseHomeData {
  final String status;
  final HomeData data;

  ResponseHomeData({required this.status, required this.data});

  factory ResponseHomeData.fromJson(Map<String, dynamic> json) {
    return ResponseHomeData(
      status: json['status'],
      data: HomeData.fromJson(json['data']),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}

class HomeData {
  final List<Source> sources;
  final List<Tip> tips;
  final List<Blog> blogs;
  final List<Video> videos;

  HomeData({required this.sources, required this.tips, required this.blogs, required this.videos});

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      sources: (json['sources'] as List).map((item) => Source.fromJson(item)).toList(),
      tips: (json['tips'] as List).map((item) => Tip.fromJson(item)).toList(),
      blogs: (json['blogs'] as List).map((item) => Blog.fromJson(item)).toList(),
      videos: (json['videos'] as List).map((item) => Video.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sources': sources.map((source) => source.toJson()).toList(),
      'tips': tips.map((tip) => tip.toJson()).toList(),
      'blogs': blogs.map((blog) => blog.toJson()).toList(),
      'videos': videos.map((video) => video.toJson()).toList(),
    };
  }
}

class Source {
  final String id;
  final String coverImage;

  Source({required this.id, required this.coverImage});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['_id'],
      coverImage: json['coverImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'coverImage': coverImage,
    };
  }
}

class Tip {
  final String id;
  final String title;
  final String image;

  Tip({required this.id, required this.title, required this.image});

  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip(
      id: json['_id'],
      title: json['title'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'image': image,
    };
  }
}

class Blog {
  final String id;
  final String title;
  final String image;

  Blog({required this.id, required this.title, required this.image});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['_id'],
      title: json['title'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'image': image,
    };
  }
}

class Video {
  final String id;
  final String title;
  final String thumbnailUrl;

  Video({required this.id, required this.title, required this.thumbnailUrl});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['_id'],
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'thumbnailUrl': thumbnailUrl,
    };
  }
}
