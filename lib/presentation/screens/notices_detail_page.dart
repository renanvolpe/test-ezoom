import 'package:coolmovies/core/extensions/resumed_sizedbox.dart';
import 'package:coolmovies/core/style/colors_app.dart';
import 'package:coolmovies/core/style/style.dart';
import 'package:coolmovies/core/utils/datetime_utils.dart';
import 'package:coolmovies/data/models/news/news_notices.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/appbar_back_btn.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/buttons_rounded.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/image_default.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoticesDetailPage extends StatefulWidget {
  const NoticesDetailPage({super.key, required this.newsNotices});

  final NewsNotices newsNotices;
  @override
  State<NoticesDetailPage> createState() => _NoticesDetailPageState();
}

class _NoticesDetailPageState extends State<NoticesDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var newsNotices = widget.newsNotices;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppbarDefaultJustBackBtn(context),
        backgroundColor: ColorsApp.kWhite,
        body: LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.45,
                child: ImageDefault(
                  url: newsNotices.photo,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.sizeH,
                    Row(
                      children: [
                        ButtonBorderPrimary(
                          onTap: () => context.pushNamed("notices_edit"),
                          paddingV: 3,
                          child: Row(
                            children: [
                              Text("Add News", style: Style.defaultLightTextStyle),
                              8.sizeW,
                              Icon(Icons.add_chart_outlined, size: 15, color: ColorsApp.kWhite),
                            ],
                          ),
                        ),
                        const Spacer(),
                        ButtonBorderPrimary(
                          onTap: () => context.pushNamed("notices_edit", extra: newsNotices),
                          paddingV: 3,
                          child: Row(
                            children: [
                              Text("Edit/Remove", style: Style.defaultLightTextStyle),
                              8.sizeW,
                              Icon(Icons.edit, size: 15, color: ColorsApp.kWhite),
                            ],
                          ),
                        )
                      ],
                    ),
                    10.sizeH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            newsNotices.title,
                            textAlign: TextAlign.center,
                            style: Style.defaultTextStyle.copyWith(fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                    15.sizeH,
                    Text(
                      "Description: ${newsNotices.description}",
                      style: Style.defaultTextStyle.copyWith(fontSize: 14),
                    ),
                    15.sizeH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Post date: ${DateTimeUtils.formatDate(newsNotices.datetimePost)}",
                          style: Style.defaultTextStyle.copyWith(fontSize: 15),
                        ),
                        5.sizeW,
                        Text(
                          "- ${DateTimeUtils.formatTime(newsNotices.datetimePost)}",
                          style: Style.defaultTextStyle.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                    15.sizeH,
                    const CommentariesNotice(),
                    10.sizeH,
                  ],
                ),
              ),
            ],
          );
        }));
  }
}

class CommentariesNotice extends StatelessWidget {
  const CommentariesNotice({
    super.key,
  });

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
