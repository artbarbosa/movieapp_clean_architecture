import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp_clean_architecture_micro_frontends/core/utils/api.utils.dart';

class CustomImageDetailWidget extends StatelessWidget {
  const CustomImageDetailWidget(
      {Key? key, required this.movieId, required this.moviePosterPath})
      : super(key: key);
  final int movieId;
  final String moviePosterPath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 68, right: 68, top: 356),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(70),
            child: Container(
              height: 100,
              color: const Color(0xFF171B39),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 63, right: 63, top: 346),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(70),
            child: Container(
              height: 100,
              color: const Color(0xFF272A46),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(70),
            child: Hero(
              tag: movieId,
              child: CachedNetworkImage(
                imageUrl: API.REQUEST_IMG(moviePosterPath),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
