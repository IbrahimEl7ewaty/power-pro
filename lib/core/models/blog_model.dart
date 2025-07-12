class Blog {
  final String? id;
  final String? title;
  final String? image;
  final String? author;
  final String? date;

  Blog({this.id, this.title, this.image, this.author, this.date});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      author: json['author'] ?? 'Unknown Author',
      date: json['date'] as String? ?? 'No Date',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'image': image,
      'author': author,
      'date': date,
    };
  }
}

class BlogResponse {
  final String status;
  final BlogData data;

  BlogResponse({required this.status, required this.data});

  factory BlogResponse.fromJson(Map<String, dynamic> json) {
    return BlogResponse(
      status: json['status'] as String,
      data: BlogData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'data': data.toJson()};
  }
}

class BlogData {
  final List<Blog>? blogs;

  BlogData({this.blogs});

  factory BlogData.fromJson(Map<String, dynamic> json) {
    return BlogData(
      blogs:
          (json['blogs'] as List<dynamic>?)
              ?.map((e) => Blog.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'blogs': blogs?.map((e) => e.toJson()).toList()};
  }
}
