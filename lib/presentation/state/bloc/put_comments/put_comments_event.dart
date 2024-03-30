part of 'put_comments_bloc.dart';

@immutable
sealed class PutCommentsEvent {}

class PutCommentsStarted extends PutCommentsEvent {
  final Comments comments;

  PutCommentsStarted({required this.comments});
}
