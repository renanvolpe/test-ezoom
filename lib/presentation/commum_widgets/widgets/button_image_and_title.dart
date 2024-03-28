import 'package:coolmovies/core/colors_app.dart';
import 'package:coolmovies/core/style.dart';
import 'package:coolmovies/data/models/news/news_notices.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/image_default.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonImageAndTitle extends StatelessWidget {
  const ButtonImageAndTitle({
    super.key,
    required this.news,
  });

  final NewsNotices news;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => context.pushNamed("notices_detail"),
        child: Stack(
          children: [
            ImageDefault(
              url: news.photo,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: Text(
                      news.title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Style.defaultLightTextStyle.copyWith(fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
