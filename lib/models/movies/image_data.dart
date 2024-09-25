class ImageData {
  final String? medium;
  final String? original;

  ImageData({this.medium, this.original});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      medium: json['medium'] as String?,
      original: json['original'] as String?,
    );
  }
}
