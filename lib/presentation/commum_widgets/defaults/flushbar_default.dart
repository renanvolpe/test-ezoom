//this is a snackbar to show to user that the function is not implemented yet
import 'package:another_flushbar/flushbar.dart';
import 'package:coolmovies/core/style/colors_app.dart';
import 'package:flutter/material.dart';

void flushbarNotImplementedYet(context) {
  Flushbar(
    title: 'It´s not develop yet',
    backgroundColor: Colors.green,
    flushbarPosition: FlushbarPosition.TOP,
    message: 'This function is not worked yet :( \nWait for new versions',
    duration: const Duration(seconds: 3),
  ).show(context);
}

Future flushbarSuccess(
  context,
  String title,
) async {
  await Flushbar(
    title: title,
    backgroundColor: ColorsApp.kPrimary,
    flushbarPosition: FlushbarPosition.TOP,
    message: "Try other functions in this app",
    duration: const Duration(seconds: 3),
  ).show(context);
}

Future flushbarError(context, String title, String message) async {
  Flushbar(
    title: title,
    backgroundColor: Colors.red,
    flushbarPosition: FlushbarPosition.TOP,
    message: message,
    duration: const Duration(seconds: 3),
  ).show(context);
}
