import 'package:coolmovies/core/style/style.dart';
import 'package:flutter/material.dart';

class CommentariesNotice extends StatefulWidget {
  const CommentariesNotice({
    super.key,
  });

  @override
  State<CommentariesNotice> createState() => _CommentariesNoticeState();
}

class _CommentariesNoticeState extends State<CommentariesNotice> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Text("Comments:", style: Style.defaultTextStyle.copyWith(fontSize: 22))],
        ),
        
      ],
    );
  }
}

