// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coolmovies/core/binds/setup_binds.dart';
import 'package:coolmovies/core/extensions/resumed_sizedbox.dart';
import 'package:coolmovies/core/style/colors_app.dart';
import 'package:coolmovies/core/style/style.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/buttons_rounded.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/flushbar_default.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/loading_shimmer_default.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/progress_indicator.dart';
import 'package:coolmovies/presentation/commum_widgets/widgets/add_comment_dialog.dart';
import 'package:coolmovies/presentation/state/bloc/delete_comments/delete_comments_bloc.dart';
import 'package:coolmovies/presentation/state/bloc/get_comments/get_comments_bloc.dart';
import 'package:coolmovies/presentation/state/bloc/post_comments/post_comments_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentariesNotice extends StatefulWidget {
  const CommentariesNotice({
    Key? key,
    required this.idNews,
  }) : super(key: key);

  final String idNews;

  @override
  State<CommentariesNotice> createState() => _CommentariesNoticeState();
}

class _CommentariesNoticeState extends State<CommentariesNotice> {
  late GetCommentsBloc getCommentsBloc;
  late DeleteCommentsBloc deleteCommentsBloc;
  late PostCommentsBloc postCommentsBloc;

  @override
  void initState() {
    SetupBinds.setupBindsComments(widget.idNews);

    getCommentsBloc = binds.get<GetCommentsBloc>();
    getCommentsBloc.add(GetCommentsStarted());
    deleteCommentsBloc = binds.get<DeleteCommentsBloc>();
    postCommentsBloc = binds.get<PostCommentsBloc>();
    super.initState();
  }

  @override
  void dispose() {
    SetupBinds.disposeBindsComments();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DeleteCommentsBloc, DeleteCommentsState>(
          bloc: deleteCommentsBloc,
          listener: (context, stateDel) =>
              stateDel is DeleteCommentsSuccess ? getCommentsBloc.add(GetCommentsStarted()) : null,
        ),
        BlocListener<PostCommentsBloc, PostCommentsState>(
            bloc: postCommentsBloc,
            listener: (context, statePost) =>
                statePost is PostCommentsSuccess ? getCommentsBloc.add(GetCommentsStarted()) : null),
      ],
      child: BlocBuilder<GetCommentsBloc, GetCommentsState>(
        bloc: getCommentsBloc,
        builder: (context, stateList) {
          return Column(
            children: [
              Ink(
                child: Row(
                  children: [
                    Text("Comments:", style: Style.defaultTextStyle.copyWith(fontSize: 22)),
                    const Spacer(),
                    ButtonBorderPrimary(
                      onTap: () => addOrEditCommentDialog(context, widget.idNews, null),
                      paddingV: 3,
                      child: InkWell(
                        child: Row(
                          children: [
                            Text("Add Comment", style: Style.defaultLightTextStyle),
                            8.sizeW,
                            Icon(Icons.message, size: 15, color: ColorsApp.kWhite),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              15.sizeH,
              if (stateList is GetCommentsProgress) const CommentsListShimmer(),
              if (stateList is GetCommentsSuccess)
                for (int index = 0; index < stateList.listComments.length; index++) ...[
                  10.sizeH,
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          tileColor: ColorsApp.kPrimary,
                          leading: CircleAvatar(
                            backgroundColor: ColorsApp.kWhite,
                            child: Icon(
                              Icons.person,
                              color: ColorsApp.kPrimary,
                            ),
                          ),
                          title: Text(stateList.listComments[index].name,
                              style: Style.defaultLightTextStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 22)),
                          subtitle: Text(stateList.listComments[index].comment, style: Style.defaultLightTextStyle),
                          trailing: Container(
                              padding: const EdgeInsets.all(5),
                              decoration:
                                  BoxDecoration(color: ColorsApp.kWhite, borderRadius: BorderRadius.circular(50)),
                              child: InkWell(
                                onTap: () =>
                                    addOrEditCommentDialog(context, widget.idNews, stateList.listComments[index]),
                                child: Icon(Icons.edit, color: ColorsApp.kPrimary),
                              )),
                        ),
                      ),
                      15.sizeW,
                      BlocConsumer<DeleteCommentsBloc, DeleteCommentsState>(
                        bloc: deleteCommentsBloc,
                        listener: (context, state) =>
                            state is DeleteCommentsSuccess ? flushbarSuccess(context, "Delete with success") : null,
                        builder: (context, state) {
                          if (state is DeleteCommentsProgress && state.id == stateList.listComments[index].uuid) {
                            return const CircularProgressIndicatorDefault();
                          }

                          return InkWell(
                            onTap: () =>
                                deleteCommentsBloc.add(DeleteCommentsStarted(id: stateList.listComments[index].uuid)),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ],
              20.sizeH
            ],
          );
        },
      ),
    );
  }
}

class CommentsListShimmer extends StatelessWidget {
  const CommentsListShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (int i = 0; i < 10; i++) ...[10.sizeH, const LoadingShimmerDefault(height: 80)],
    ]);
  }
}
