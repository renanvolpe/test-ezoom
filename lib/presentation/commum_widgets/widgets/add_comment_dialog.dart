import 'package:coolmovies/core/binds/setup_binds.dart';
import 'package:coolmovies/core/extensions/resumed_sizedbox.dart';
import 'package:coolmovies/core/style/colors_app.dart';
import 'package:coolmovies/core/style/style.dart';
import 'package:coolmovies/data/models/comments/comments.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/progress_indicator.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/textfield_decoration.dart';
import 'package:coolmovies/presentation/state/bloc/post_comments/post_comments_bloc.dart';
import 'package:coolmovies/presentation/state/bloc/put_comments/put_comments_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> addOrEditCommentDialog(BuildContext context, String idNews, Comments? commentsEdit) {
  final formKey = GlobalKey<FormState>();
  final PostCommentsBloc postCommentsBloc = binds.get<PostCommentsBloc>();
  final PutCommentsBloc putCommentsBloc = binds.get<PutCommentsBloc>();

  bool isEditing = commentsEdit != null;
  String mandatoryMessage = "This fields is mandadotry";
  //start new comment if is not to edit
  Comments newComment = commentsEdit ??
      Comments(uuid: '', comment: "", name: "", dateTime: DateTime.now().toIso8601String(), idNews: idNews);
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ColorsApp.kWhite,
        surfaceTintColor: Colors.transparent,
        title: Text('Add new comment here', style: Style.defaultTextStyle.copyWith(fontSize: 22)),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: newComment.name,
                onChanged: (value) => newComment.name = value,
                validator: (value) => value!.isEmpty ? mandatoryMessage : null,
                decoration: textfieldDecorationDefault(hintText: "Name"),
              ),
              20.sizeH,
              TextFormField(
                initialValue: newComment.comment,
                onChanged: (value) => newComment.comment = value,
                validator: (value) => value!.isEmpty ? mandatoryMessage : null,
                maxLines: null,
                decoration: textfieldDecorationDefault(hintText: "Comment"),
              )
            ],
          ),
        ),
        actions: <Widget>[
          BlocConsumer<PutCommentsBloc, PutCommentsState>(
            bloc: putCommentsBloc,
            listener: (context, statePut) => statePut is PutCommentsSuccess ? Navigator.pop(context) : null,
            builder: (context, statePut) {
              return BlocConsumer<PostCommentsBloc, PostCommentsState>(
                bloc: postCommentsBloc,
                listener: (context, statePost) => statePost is PostCommentsSuccess ? Navigator.pop(context) : null,
                builder: (context, statePost) {
                  if (statePost is PostCommentsProgress || statePut is PutCommentsProgress) {
                    return const CircularProgressIndicatorDefault();
                  }
                  return TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: Text(isEditing ? "Update Comment" : 'Add Comment', style: Style.primaryTextStyle),
                    onPressed: () {
                      bool isValid = formKey.currentState!.validate();
                      if (isValid) {
                        if (isEditing) {
                          putCommentsBloc.add(PutCommentsStarted(comments: newComment));
                        } else {
                          postCommentsBloc.add(PostCommentsStarted(comments: newComment));
                        }
                      }
                    },
                  );
                },
              );
            },
          ),
        ],
      );
    },
  );
}
