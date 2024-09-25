class Rating {
  final double? average;

  Rating({this.average});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: (json['average'] != null) ? (json['average'] as num).toDouble() : null,
    );
  }
}
