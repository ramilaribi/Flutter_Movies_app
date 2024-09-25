import 'show.dart';

class Movie {
  final double score; 
  final Show show;

  Movie({required this.score, required this.show});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      score: (json['score'] ?? 0.0) as double,
      show: Show.fromJson(json['show']),
    );
  }
}
