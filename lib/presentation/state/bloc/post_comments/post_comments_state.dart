part of 'post_comments_bloc.dart';

@immutable
sealed class PostCommentsState {}

final class PostCommentsInitial extends PostCommentsState {}
final class PostCommentsProgress extends PostCommentsState {}
final class PostCommentsSuccess extends PostCommentsState {
  final dynamic value;
  PostCommentsSuccess(this.value);
}
final class PostCommentsFailure extends PostCommentsState {
  final String message;
  PostCommentsFailure(this.message);
}
