import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp_clean_architecture_micro_frontends/core/utils/api.utils.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/domain/entities/movie_details_entity.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/presentation/ui/pages/details_page.dart';

class CustomListCardWidget extends StatelessWidget {
  final MovieDetailsEntity movie;
  const CustomListCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Hero(
        tag: movie.id,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailsPage(movie: movie),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CachedNetworkImage(
                  height: 350,
                  imageUrl: API.REQUEST_IMG(movie.posterPath),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 20),
                child: Text.rich(
                  TextSpan(
                      text: movie.title,
                      style: GoogleFonts.beVietnamPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      )),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 5),
                child: RatingBarIndicator(
                  rating: (movie.voteAverage.roundToDouble() / 2),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Color(0xFFFEA136),
                  ),
                  itemCount: 5,
                  itemSize: 15.0,
                  direction: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
