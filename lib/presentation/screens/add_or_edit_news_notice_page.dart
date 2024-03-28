import 'package:coolmovies/core/extensions/resumed_sizedbox.dart';
import 'package:coolmovies/core/style/colors_app.dart';
import 'package:coolmovies/core/style/style.dart';
import 'package:coolmovies/core/utils/datetime_utils.dart';
import 'package:coolmovies/data/models/news/news_notices.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/appbar_back_btn.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/buttons_rounded.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/image_default.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/textfield_decoration.dart';
import 'package:flutter/material.dart';

class AddOrEditNewsNoticePage extends StatefulWidget {
  const AddOrEditNewsNoticePage({super.key, required this.newsNotices});

  final NewsNotices? newsNotices;

  @override
  State<AddOrEditNewsNoticePage> createState() => _AddOrEditNewsNoticePageState();
}

class _AddOrEditNewsNoticePageState extends State<AddOrEditNewsNoticePage> {
  final _formKey = GlobalKey<FormState>();

  late NewsNotices newsNotices;
  late TextEditingController titlefield;
  late TextEditingController descriptionField;

  
  @override
  void initState() {
    newsNotices = widget.newsNotices ?? NewsNotices.empty();
    titlefield = TextEditingController(text: newsNotices.title);
    descriptionField = TextEditingController(text: newsNotices.description);

    super.initState();
  }

  bool _isEditing() => widget.newsNotices != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppbarDefaultJustBackBtn(context),
        backgroundColor: ColorsApp.kWhite,
        body: LayoutBuilder(builder: (context, constraints) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
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
                        15.sizeH,
                        if (_isEditing())
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ButtonPrimary(
                                onTap: () {},
                                paddingV: 3,
                                child: Row(
                                  children: [
                                    Text("Remove News", style: Style.defaultLightTextStyle.copyWith(color: Colors.red)),
                                    8.sizeW,
                                    const Icon(Icons.close, size: 15, color: Colors.red),
                                  ],
                                ),
                              )
                            ],
                          ),
                        5.sizeH,
                        Text("Title:", style: Style.defaultTextStyle),
                        3.sizeH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: textfieldDecorationDefault(),
                                controller: titlefield,
                              ),
                            ),
                          ],
                        ),
                        15.sizeH,
                        Text("Decription:", style: Style.defaultTextStyle),
                        3.sizeH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                maxLines: null,
                                decoration: textfieldDecorationDefault(),
                                controller: descriptionField,
                              ),
                            ),
                          ],
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
                        35.sizeH,
                        Row(
                          children: [
                            Expanded(
                                child: ButtonBorderPrimary(
                              onTap: () {},
                              text: "Update News",
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
