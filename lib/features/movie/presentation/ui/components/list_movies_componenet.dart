import 'package:flutter/material.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/domain/entities/movie_entity.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/presentation/controllers/movie_controller.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/presentation/ui/widgets/custom_list_card_widget.dart';

class ListMoviesComponent extends StatelessWidget {
  const ListMoviesComponent({Key? key, required this.controller}) : super(key: key);

  final MovieController controller ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ValueListenableBuilder<MovieEntity?>(
        valueListenable: controller.movies,
        builder: (_, movies, __) {
          return movies != null
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: movies.listMovies.length,
                  itemBuilder: (_, idx) => CustomListCardWidget(
                    movie: movies.listMovies[idx],
                  ),
                )
              : Container();
        },
      ),
    );
  }
}
