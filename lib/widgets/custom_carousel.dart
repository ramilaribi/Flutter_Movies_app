import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movies/show.dart';
import 'package:movie_app/widgets/landing_card.dart'; 

class CustomCarouselSlider extends StatelessWidget {
  final List<Show> shows;
  final Function(int) onMovieTap; 

  const CustomCarouselSlider({Key? key, required this.shows, required this.onMovieTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final validShows = shows.where((show) => show.image?.original?.isNotEmpty ?? false).toList();

    var carouselOptions = CarouselOptions(
      height: size.height * 0.4,
      viewportFraction: 1.0,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    );

    return SizedBox(
      width: size.width,
      height: size.height * 0.4,
      child: CarouselSlider.builder(
        itemCount: validShows.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final show = validShows[index];
          final imageUrl = show.image!.original!; 

          return GestureDetector(
            onTap: () {
              onMovieTap(show.id); 
            },
            child: LandingCard(
              image: NetworkImage(imageUrl), 
              name: show.name.toString(), 
            ),
          );
        },
        options: carouselOptions,
      ),
    );
  }
}
