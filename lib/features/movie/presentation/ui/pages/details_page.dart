import 'package:flutter/material.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/domain/entities/movie_details_entity.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/presentation/ui/widgets/custom_image_detail_widget.dart';

class DetailsPage extends StatelessWidget {
  final MovieDetailsEntity movie;
  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070D2D),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
              'Detail movie',
              style: TextStyle(fontSize: 25),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                return Navigator.pop(context);
              },
              icon:
                  const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
            ),
            backgroundColor: const Color(0xFF070D2D),
            expandedHeight: 80,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_outline_rounded,
                    size: 30,
                  )),
            ],
          ),
          SliverToBoxAdapter(
            child: CustomImageDetailWidget(
              movieId: movie.id,
              moviePosterPath: movie.posterPath,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 14.0),
                  child: Text(
                    movie.title,
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 6.0),
                  child: Row(
                    children: [
                      Text(
                        '${movie.releaseDate}  |  ${movie.voteAverage} ',
                        style: const TextStyle(fontSize: 17),
                      ),
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: Color(0xFFFEA136),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 6.0),
                  child: Text(
                    movie.overview,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
