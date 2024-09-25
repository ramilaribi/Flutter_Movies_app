import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'package:movie_app/screens/movie_detail_screen.dart';
import '../controllers/movie_controller.dart';
import '../models/movies/movie.dart';

class SearchScreen extends StatelessWidget {
  final MovieController movieController = Get.find<MovieController>();
  final TextEditingController searchController = TextEditingController();

  String truncateSummary(String htmlSummary, {int maxLength = 100}) {
    dom.Document document = parse(htmlSummary);
    String text = document.body?.text ?? '';

    if (text.length > maxLength) {
      return '${text.substring(0, maxLength)}...';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
   backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.03,right: screenWidth * 0.03, top: screenHeight * 0.07), // Reduced vertical padding
        child: Column(
          children: [
            CupertinoSearchTextField(
              controller: searchController,
              padding: const EdgeInsets.all(10.0),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                Icons.cancel,
                color: Colors.grey,
              ),
              style: const TextStyle(color: Colors.white),
              backgroundColor: Colors.grey.withOpacity(0.3),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  movieController.searchMovies(value);
                }
              },
            ),
            SizedBox(height: screenHeight * 0.03), 
            Expanded(
              child: Obx(() {
                if (movieController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (movieController.errorMessage.value.isNotEmpty) {
                  return Center(child: Text(movieController.errorMessage.value));
                } else {
                  return ListView.builder(
                    itemCount: movieController.movies.length,
                    itemBuilder: (context, index) {
                      Movie movie = movieController.movies[index];
                      return ListTile(
                        title: Text(
                          movie.show?.name ?? 'Unknown Movie',
                          style: TextStyle(
                            fontSize: screenWidth > 600 ? 24 : 20, 
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            truncateSummary(movie.show?.summary ?? 'No summary available'),
                            style: TextStyle(
                              fontSize: screenWidth > 600 ? 16 : 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        leading: movie.show?.image?.original != null
                            ? Image.network(
                                movie.show!.image!.original!,
                                width: screenWidth * 0.15,
                                height: screenWidth * 0.15,
                                fit: BoxFit.fill,
                              )
                            : Image.asset(
                                'assets/placeholder.png', 
                                width: screenWidth * 0.15,
                                height: screenWidth * 0.15,
                                fit: BoxFit.fill,
                              ),
                        onTap: () {
                          Get.to(() => MovieDetailScreen(show: movie.show!));
                        },
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
