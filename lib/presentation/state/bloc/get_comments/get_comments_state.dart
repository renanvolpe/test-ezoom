part of 'get_comments_bloc.dart';

@immutable
sealed class GetCommentsState {}

final class GetCommentsInitial extends GetCommentsState {}
final class GetCommentsProgress extends GetCommentsState {}
final class GetCommentsSuccess extends GetCommentsState {
  final List<Comments> listComments;
  GetCommentsSuccess(this.listComments);
}
final class GetCommentsFailure extends GetCommentsState {
  final String message;
  GetCommentsFailure(this.message);
}
