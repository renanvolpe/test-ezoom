part of 'put_news_notices_bloc.dart';

@immutable
sealed class PutNewsNoticesState {}

final class PutNewsNoticesInitial extends PutNewsNoticesState {}
final class PutNewsNoticesProgress extends PutNewsNoticesState {}
final class PutNewsNoticesSuccess extends PutNewsNoticesState {
  final dynamic value;
  PutNewsNoticesSuccess(this.value);
}
final class PutNewsNoticesFailure extends PutNewsNoticesState {
  final String message;
  PutNewsNoticesFailure(this.message);
}
