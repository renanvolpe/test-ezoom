// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coolmovies/core/binds/setup_binds.dart';
import 'package:coolmovies/presentation/commum_widgets/widgets/bottom_navigation_home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);
  final StatefulNavigationShell navigationShell;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    SetupBinds.setupBindsHome();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    SetupBinds.disposeBindsHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationHome(child: widget.navigationShell),
      body: widget.navigationShell,
      // [
      //   NoticesPage(),
      //   AccountPage()
      // ]
    );
  }
}
