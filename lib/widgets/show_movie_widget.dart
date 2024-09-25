import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movies/show.dart';

class ShowMovieWidget extends StatelessWidget {
  final Show show;

  const ShowMovieWidget({
    Key? key,
    required this.show,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final imageUrl = show.image?.original;

    return SizedBox(
      width: size.width,
      child: Padding(
        padding:  EdgeInsets.all(size.width * 0.02),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                 SizedBox(height: size.height * 0.12),
                Text(
                  show.name.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  show.language.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 5,
                  ),
                ),
              ],
            ),
             SizedBox(width: size.width * 0.02),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imageUrl != null && imageUrl.isNotEmpty 
                      ? CachedNetworkImage(
                          imageUrl: imageUrl,
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        )
                      :  SizedBox(height: size.height * 0.4, child: Icon(Icons.image_not_supported)), 
             
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
