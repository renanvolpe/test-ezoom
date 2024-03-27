//this extension is for create SizedBox space more simplify
import 'package:flutter/material.dart';

extension EmptyWidget on num {
  SizedBox get sizeH => SizedBox(
        height: toDouble(),
      );

  SizedBox get sizeW => SizedBox(
        width: toDouble(),
      );
}
