class Video {
  final String title;
  final String videoUrl;
  final String platform;

  Video({required this.title, required this.videoUrl, required this.platform});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      title: json['title'],
      videoUrl: json['video_url'],
      platform: json['platform'],
    );
  }
}
