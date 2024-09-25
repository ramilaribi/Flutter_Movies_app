import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movies/show.dart';
import '../models/movies/movie.dart';
import '../config/config.dart';

class MovieService {
  Future<List<Movie>> fetchAllMovies() async {
    try {
      final response = await http.get(Uri.parse(ApiConfig.allMoviesEndpoint));
      if (response.statusCode == 200) {
        final List<dynamic> movieList = json.decode(response.body);
        return movieList.map<Movie?>((movieData) {
          if (movieData is Map<String, dynamic> && movieData['show'] != null) {
            try {
              return Movie(
                score: (movieData['score'] ?? 0.0) as double,
                show: Show.fromJson(movieData['show']),
              );
            } catch (e) {
              return null;  
            }
          } else {
            return null; 
          }
        }).whereType<Movie>().toList(); 
      } else {
        throw Exception('Failed to load movies: HTTP ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load movies due to network or parsing issue: $error');
    }
  }

  Future<List<Show>> searchMovies(String searchTerm) async {
    try {
      final response = await http.get(Uri.parse(ApiConfig.searchMoviesEndpoint(searchTerm)));
      if (response.statusCode == 200) {
        final List<dynamic> movieList = json.decode(response.body);
        return movieList.map<Show?>((movieData) {
          if (movieData['show'] != null) {
            try {
              return Show.fromJson(movieData['show']);
            } catch (e) {
              return null;
            }
          } else {
            return null;
          }
        }).whereType<Show>().toList();
      } else {
        throw Exception('Failed to load movies: HTTP ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load movies due to network or parsing issue: $error');
    }
  }
}
