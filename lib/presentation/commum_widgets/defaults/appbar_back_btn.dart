import 'package:coolmovies/core/style/colors_app.dart';
import 'package:flutter/material.dart';

AppBar AppbarDefaultJustBackBtn(BuildContext context) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.transparent, // Set AppBar background color to transparent
    elevation: 0, // Remove AppBar elevation
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: CircleAvatar(
        backgroundColor: ColorsApp.kWhite,
        child: const Icon(
          Icons.chevron_left,
          color: Colors.black,
        ),
      ),
    ),
  );
}
