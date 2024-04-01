// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coolmovies/core/style/colors_app.dart';
import 'package:coolmovies/core/style/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class BottomNavigationHome extends StatelessWidget {
  const BottomNavigationHome({
    Key? key,
    required this.child,
  }) : super(key: key);
  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedLabelStyle: Style.primaryTextStyle.copyWith(fontSize: 16),
        selectedItemColor: ColorsApp.kPrimary,
        unselectedItemColor: ColorsApp.kDarkGrey,
        onTap: (index) => child.goBranch(index),
        currentIndex: child.currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "Notices"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Resume")
        ]);
  }
}
