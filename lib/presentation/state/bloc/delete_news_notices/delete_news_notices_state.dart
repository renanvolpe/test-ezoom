part of 'delete_news_notices_bloc.dart';

@immutable
sealed class DeleteNewsNoticesState {}

final class DeleteNewsNoticesInitial extends DeleteNewsNoticesState {}
final class DeleteNewsNoticesProgress extends DeleteNewsNoticesState {}
final class DeleteNewsNoticesSuccess extends DeleteNewsNoticesState {
  final String message;
  DeleteNewsNoticesSuccess(this.message);
}
final class DeleteNewsNoticesFailure extends DeleteNewsNoticesState {
  final String message;
  DeleteNewsNoticesFailure(this.message);
}
