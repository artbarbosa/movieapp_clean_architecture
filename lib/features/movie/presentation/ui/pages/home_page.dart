import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/domain/entities/movie_entity.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/presentation/controllers/movie_controller.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/presentation/ui/components/bottom_navigator_component.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/presentation/ui/components/list_movies_componenet.dart';
import 'package:movieapp_clean_architecture_micro_frontends/features/movie/presentation/ui/components/textfield_search_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final MovieController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GetIt.I.get<MovieController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF070D2D),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              ValueListenableBuilder<MovieEntity?>(
                valueListenable: _controller.movies,
                builder: (__, movies, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 10,
                        ),
                        child: Text(
                          'Movies',
                          style: TextStyle(
                            color: Color(0xFFF4F7FF),
                            fontSize: 40,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFieldSearchComponent(
                        controller: _controller,
                      )
                    ],
                  );
                },
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        'All Movies',
                        style:
                            TextStyle(color: Color(0xFFF4F7FF), fontSize: 26),
                      ),
                    ),
                  )),
              ListMoviesComponent(
                controller: _controller,
              )
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigatorComponent());
  }
}
