part of 'delete_comments_bloc.dart';

@immutable
sealed class DeleteCommentsState {}

final class DeleteCommentsInitial extends DeleteCommentsState {}
final class DeleteCommentsProgress extends DeleteCommentsState {}
final class DeleteCommentsSuccess extends DeleteCommentsState {
  final String message;
  DeleteCommentsSuccess(this.message);
}
final class DeleteCommentsFailure extends DeleteCommentsState {
  final String message;
  DeleteCommentsFailure(this.message);
}
