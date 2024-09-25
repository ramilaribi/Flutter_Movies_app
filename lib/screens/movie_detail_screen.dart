import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'package:movie_app/models/movies/show.dart';

class MovieDetailScreen extends StatelessWidget {
  final Show show;

  const MovieDetailScreen({super.key, required this.show});

  String truncateSummary(String htmlSummary, {int maxLength = 500}) {
    dom.Document document = parse(htmlSummary);
    String text = document.body?.text ?? '';

    if (text.length > maxLength) {
      return '${text.substring(0, maxLength)}...';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView( 
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.width * 0.15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: double.infinity,
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: show.image?.original != null && show.image!.original!.isNotEmpty
                    ? Image.network(
                        show.image!.original!,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/placeholder.png',
                            fit: BoxFit.fill,
                          );
                        },
                      )
                    : Image.asset(
                        'assets/images/placeholder.png', 
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            SizedBox(height: size.width * 0.1),
            Row(
              children: [
                const Text(
                  "Rating",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: size.width * 0.04),
                Text(
                  show.rating?.average != null ? show.rating!.average.toString() : '',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: size.width * 0.05,
                  ),
                ),
                SizedBox(width: size.width * 0.06),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: size.width * 0.05,
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              show.name ?? 'Movie',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.06, 
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              truncateSummary(show.summary ?? 'No summary available'),
              style: TextStyle(
                fontSize: size.width * 0.04,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
