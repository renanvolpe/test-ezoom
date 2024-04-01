part of 'post_comments_bloc.dart';

@immutable
sealed class PostCommentsEvent {}

class PostCommentsStarted extends PostCommentsEvent {
  final Comments comments;

  PostCommentsStarted({required this.comments});
}
