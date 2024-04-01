part of 'put_comments_bloc.dart';

@immutable
sealed class PutCommentsState {}

final class PutCommentsInitial extends PutCommentsState {}
final class PutCommentsProgress extends PutCommentsState {}
final class PutCommentsSuccess extends PutCommentsState {
  final String message;
  PutCommentsSuccess(this.message);
}
final class PutCommentsFailure extends PutCommentsState {
  final String message;
  PutCommentsFailure(this.message);
}
