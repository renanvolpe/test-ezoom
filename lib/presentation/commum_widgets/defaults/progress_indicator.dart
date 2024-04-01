import 'package:coolmovies/core/style/colors_app.dart';
import 'package:flutter/material.dart';


class CircularProgressIndicatorDefault extends StatelessWidget {
  const CircularProgressIndicatorDefault({super.key, this.isLight = false});

  final bool isLight;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: isLight ? ColorsApp.kWhite : ColorsApp.kPrimary,
      ),
    );
  }
}
