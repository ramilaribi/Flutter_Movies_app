import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/screens/search_screen.dart';
import 'package:movie_app/widgets/custom_carousel.dart';
import '../controllers/movie_controller.dart';
import 'package:movie_app/screens/movie_detail_screen.dart';
import 'package:movie_app/widgets/show_movie_widget.dart';

class HomePage extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logo.png',
              height: size.height * 0.06,
              width: size.width * 0.1,
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Movies',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.height * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => SearchScreen());
              },
              child: Icon(
                Icons.search,
                size: size.height * 0.04,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (movieController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (movieController.errorMessage.isNotEmpty) {
          return Center(child: Text(movieController.errorMessage.value));
        }
        if (movieController.movies.isNotEmpty) {
          final shows = movieController.movies.map((movie) => movie.show).toList();

          return SingleChildScrollView(
            child: Column(
              children: [
                CustomCarouselSlider(
                  shows: shows,
                  onMovieTap: (showId) {
                    final selectedShow = movieController.movies
                        .map((movie) => movie.show) 
                        .firstWhere((show) => show.id == showId);
                    Get.to(() => MovieDetailScreen(show: selectedShow)); 
                  },
                ),
                SizedBox(height: size!.height * 0.01 ),
                Text(
                   "  Everyone's watching   🔥 ",
                    style: TextStyle(
                      fontSize: size.height * 0.025, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                    SizedBox(height: size!.height * 0.01 ),
                ...movieController.movies.map((movie) => ShowMovieWidget(show: movie.show)).toList(),
              ],
            ),
          );
        } else {
          return const Center(child: Text('No movies found.'));
        }
      }),
    );
  }
}
