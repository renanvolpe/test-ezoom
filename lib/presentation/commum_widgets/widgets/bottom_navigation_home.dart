// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const List<String> listRoutes = ["Notices", "account"];

class BottomNavigationHome extends StatelessWidget {
  const BottomNavigationHome({
    Key? key,
    required this.child,
  }) : super(key: key);
  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: (index) => child.goBranch(index), currentIndex: child.currentIndex, items: const [
      BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Notices"),
      BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Account")
    ]);
  }
}
