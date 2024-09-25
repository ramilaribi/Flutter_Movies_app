import 'package:get/get.dart';
import '../models/movies/movie.dart';
import '../services/movie_service.dart';

class MovieController extends GetxController {
  final MovieService movieService = MovieService();
  var movies = <Movie>[].obs;  
  var isLoading = true.obs;  
  var errorMessage = ''.obs;  

  @override
  void onInit() {
    super.onInit();
    fetchAllMovies();  
  }

  Future<void> fetchAllMovies() async {
    isLoading.value = true; 
    errorMessage.value = '';  

    try {
      final fetchedShows = await movieService.fetchAllMovies();
      if (fetchedShows.isNotEmpty) {
        movies.assignAll(fetchedShows);  
      } else {
        errorMessage.value = 'No movies available';  
      }
    } catch (e) {
      errorMessage.value = 'Error fetching movies: ${e.toString()}';
    } finally {
      isLoading.value = false; 
    }
  }

  void searchMovies(String searchTerm) async {
    if (searchTerm.isEmpty) {
      errorMessage.value = 'Please enter a search term.';
      return;
    }

    isLoading.value = true; 
    errorMessage.value = '';

    try {
      var response = await movieService.searchMovies(searchTerm);
      if (response.isNotEmpty) {
        movies.value = response.map((show) => Movie(
          score: 1 , 
          show: show,
        )).toList();
      } else {
        errorMessage.value = 'No movies found';
      }
    } catch (error) {
      errorMessage.value = 'Error: $error';
    } finally {
      isLoading.value = false;
    }
  }
}
