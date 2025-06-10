class ProjectModel {
  final String title;
  final String description;
  final String? githubLink;
  final bool isFeatured;
  final String? thumbnail;
  final List<String> images;
  final String? downloadUrl;
  final bool isDownloadable;
  final List<String> tags;
  final bool? isOpenSource;

  const ProjectModel({
    required this.title,
    required this.description,
    this.githubLink,
    required this.isFeatured,
    this.thumbnail,
    this.images = const [],
    this.downloadUrl,
    required this.isDownloadable,
    this.tags = const [],
    this.isOpenSource,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      title: json['title'],
      description: json['description'],
      githubLink: json['githubLink'],
      isFeatured: json['isFeatured'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images'] ?? []),
      downloadUrl: json['downloadUrl'],
      isDownloadable: json['isDownloadable'],
      tags: List<String>.from(json['tags'] ?? []),
      isOpenSource: json['isOpenSource'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'githubLink': githubLink,
      'isFeatured': isFeatured,
      'thumbnail': thumbnail,
      'images': images,
      'downloadUrl': downloadUrl,
      'isDownloadable': isDownloadable,
      'tags': tags,
      'isOpenSource': isOpenSource,
    };
  }
}
