class ApiConfig {
  static const String baseUrl = 'https://api.tvmaze.com';
  static const String allMoviesEndpoint = '$baseUrl/search/shows?q=all';
  static String searchMoviesEndpoint(String searchTerm) =>'$baseUrl/search/shows?q=$searchTerm';
}