import 'package:coolmovies/core/binds/setup_binds.dart';
import 'package:coolmovies/core/extensions/resumed_sizedbox.dart';
import 'package:coolmovies/core/style/colors_app.dart';
import 'package:coolmovies/core/style/style.dart';
import 'package:coolmovies/core/utils/datetime_utils.dart';
import 'package:coolmovies/data/models/news/news_notices.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/appbar_back_btn.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/buttons_rounded.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/flushbar_default.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/image_default.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/progress_indicator.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/textfield_decoration.dart';
import 'package:coolmovies/presentation/state/bloc/delete_news_notices/delete_news_notices_bloc.dart';
import 'package:coolmovies/presentation/state/bloc/post_news_notices/post_news_notices_bloc.dart';
import 'package:coolmovies/presentation/state/bloc/put_news_notices/put_news_notices_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddOrEditNewsNoticePage extends StatefulWidget {
  const AddOrEditNewsNoticePage({super.key, this.newsNotices});

  final NewsNotices? newsNotices;

  @override
  State<AddOrEditNewsNoticePage> createState() => _AddOrEditNewsNoticePageState();
}

class _AddOrEditNewsNoticePageState extends State<AddOrEditNewsNoticePage> {
  final _formKey = GlobalKey<FormState>();

  late NewsNotices newsNotices;
  late TextEditingController titlefield;
  late TextEditingController descriptionField;

  late PutNewsNoticesBloc putNewsNoticesBloc;
  late DeleteNewsNoticesBloc deleteNewsNoticesBloc;
  late PostNewsNoticesBloc postNewsNoticesBloc;

  @override
  void initState() {
    newsNotices = widget.newsNotices ?? NewsNotices.empty();
    titlefield = TextEditingController(text: newsNotices.title);
    descriptionField = TextEditingController(text: newsNotices.description);

    putNewsNoticesBloc = binds.get<PutNewsNoticesBloc>();
    deleteNewsNoticesBloc = binds.get<DeleteNewsNoticesBloc>();
    postNewsNoticesBloc = binds.get<PostNewsNoticesBloc>();

    super.initState();
  }

  bool _isEditing() => widget.newsNotices != null;
  String _getTextButton() => _isEditing() ? "Update News" : "Create news";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppbarDefaultJustBackBtn(context),
        backgroundColor: ColorsApp.kWhite,
        body: MultiBlocListener(
          listeners: [
            BlocListener<PostNewsNoticesBloc, PostNewsNoticesState>(
              bloc: postNewsNoticesBloc,
              listener: (context, state) async {
                if (state is PostNewsNoticesFailure) {
                  flushbarError(context, "Created Error", "Review your data");
                }
                if (state is PostNewsNoticesSuccess) {
                  await flushbarSuccess(context, "Created Success");
                  // ignore: use_build_context_synchronously
                  context.pushNamed("notices");
                }
              },
            ),
            BlocListener<PutNewsNoticesBloc, PutNewsNoticesState>(
              bloc: putNewsNoticesBloc,
              listener: (context, state) async {
                if (state is PutNewsNoticesFailure) {
                  flushbarError(context, "Updated Error", "Review your data");
                }
                if (state is PutNewsNoticesSuccess) {
                  await flushbarSuccess(context, "Updated Success");
                  // ignore: use_build_context_synchronously
                  context.pushNamed("notices");
                }
              },
            ),
            BlocListener<DeleteNewsNoticesBloc, DeleteNewsNoticesState>(
              bloc: deleteNewsNoticesBloc,
              listener: (context, state) async {
                if (state is DeleteNewsNoticesSuccess) {
                  await flushbarSuccess(context, "Deleted Success");
                  // ignore: use_build_context_synchronously
                  context.pushNamed("notices");
                }
                if (state is DeleteNewsNoticesFailure) {
                  flushbarError(context, "Deleted Error", "Review your data");
                }
              },
            ),
          ],
          child: LayoutBuilder(builder: (context, constraints) {
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
                                BlocBuilder<DeleteNewsNoticesBloc, DeleteNewsNoticesState>(
                                  bloc: deleteNewsNoticesBloc,
                                  builder: (context, state) {
                                    if (state is DeleteNewsNoticesProgress) {
                                      return ButtonPrimary(
                                        child: Row(
                                          children: [
                                            Text("Remove News",
                                                style: Style.defaultLightTextStyle.copyWith(color: Colors.red)),
                                            8.sizeW,
                                            const SizedBox(
                                                height: 15, width: 15, child: CircularProgressIndicatorDefault())
                                          ],
                                        ),
                                      );
                                    }
                                    return ButtonPrimary(
                                      onTap: () =>
                                          deleteNewsNoticesBloc.add(DeleteNewsNoticesStarted(id: newsNotices.uuid)),
                                      paddingV: 3,
                                      child: Row(
                                        children: [
                                          Text("Remove News",
                                              style: Style.defaultLightTextStyle.copyWith(color: Colors.red)),
                                          8.sizeW,
                                          const Icon(Icons.close, size: 15, color: Colors.red),
                                        ],
                                      ),
                                    );
                                  },
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
                                  initialValue: newsNotices.title,
                                  onChanged: (value) => newsNotices.title = value,
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
                                  initialValue: newsNotices.description,
                                  onChanged: (value) => newsNotices.description = value,
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
                          BlocBuilder<PostNewsNoticesBloc, PostNewsNoticesState>(
                            bloc: postNewsNoticesBloc,
                            builder: (context, statePost) {
                              return BlocBuilder<PutNewsNoticesBloc, PutNewsNoticesState>(
                                bloc: putNewsNoticesBloc,
                                builder: (context, statePut) {
                                  if (statePost is PostNewsNoticesProgress || statePut is PutNewsNoticesProgress) {
                                    return const Row(
                                      children: [
                                        Expanded(
                                            child: ButtonBorderPrimary(
                                          child: CircularProgressIndicatorDefault(isLight: true),
                                        ))
                                      ],
                                    );
                                  }
                                  return Row(
                                    children: [
                                      Expanded(
                                          child: ButtonBorderPrimary(
                                        onTap: () {
                                          if (_isEditing()) {
                                            putNewsNoticesBloc.add(PutNewsNoticesStarted(newsNotices: newsNotices));
                                          } else {
                                            postNewsNoticesBloc.add(PostNewsNoticesStarted(newsNotices: newsNotices));
                                          }
                                        },
                                        text: _getTextButton(),
                                      ))
                                    ],
                                  );
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
