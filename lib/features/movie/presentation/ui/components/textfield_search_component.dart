import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/presentation/controllers/movie_controller.dart';

class TextFieldSearchComponent extends StatelessWidget {
  const TextFieldSearchComponent({Key? key, required this.controller}) : super(key: key);

  final MovieController controller;

  @override
  Widget build(BuildContext context) {
    return                       Container(
                        height: 80,
                        width: 350,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              style: BorderStyle.solid,
                              width: 2,
                              color: const Color(0xFF161A36)),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: controller.onChanged,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: 'Search your movie',
                                  hintStyle: GoogleFonts.beVietnamPro(
                                      color: const Color(0xFF373D5D)),
                                  prefixIcon:
                                      const Icon(Icons.search_rounded),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
  }
}