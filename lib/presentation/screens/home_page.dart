// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coolmovies/core/binds/setup_binds.dart';
import 'package:coolmovies/core/colors_app.dart';
import 'package:coolmovies/core/extensions/resumed_sizedbox.dart';
import 'package:coolmovies/core/style.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/image_default.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/textfield_decoration.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationHome(child: widget.navigationShell),
      body: widget.navigationShell,
    );
  }
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  30.sizeH,
                  for (int i = 0; i < 8; i++) ...[
                    30.sizeH,
                    Row(
                      children: [
                        const ButtonImageAndTitle(),
                        10.sizeW,
                        const ButtonImageAndTitle(),
                      ],
                    )
                  ]
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    decoration: textfieldDecorationDefault(hintText: "Search category here", endIcon: Icons.search),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonImageAndTitle extends StatelessWidget {
  const ButtonImageAndTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          const ImageDefault(
            url: "",
            height: 120,
            radius: 10,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                alignment: Alignment.center,
                color: ColorsApp.kGrey,
                child: Text(
                  "Name category ",
                  style: Style.defaultLightTextStyle.copyWith(fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
