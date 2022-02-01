import 'package:flutter/material.dart';

class BottomNavigatorComponent extends StatelessWidget {
  const BottomNavigatorComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF070D2D),
      items: const [
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.home_rounded,
            color: Color(0xFF566CE2),
            size: 32,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.explore_outlined,
            color: Color(0xFF566CE2),
            size: 32,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.person_outline_rounded,
            color: Color(0xFF566CE2),
            size: 32,
          ),
        ),
      ],
    );
  }
}
