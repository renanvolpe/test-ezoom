part of 'post_news_notices_bloc.dart';
@immutable
sealed class PostNewsNoticesState {}

final class PostNewsNoticesInitial extends PostNewsNoticesState {}
final class PostNewsNoticesProgress extends PostNewsNoticesState {}
final class PostNewsNoticesSuccess extends PostNewsNoticesState {
  final String message;
  PostNewsNoticesSuccess(this.message);
}
final class PostNewsNoticesFailure extends PostNewsNoticesState {
  final String message;
  PostNewsNoticesFailure(this.message);
}
