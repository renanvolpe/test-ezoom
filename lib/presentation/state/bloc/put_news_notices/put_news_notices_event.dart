part of 'put_news_notices_bloc.dart';

@immutable
sealed class PutNewsNoticesEvent {}

class PutNewsNoticesStarted extends PutNewsNoticesEvent {
  final NewsNotices newsNotices;

  PutNewsNoticesStarted({required this.newsNotices});
}
class PutNewsNoticesReseted extends PutNewsNoticesEvent{}
//PutNewsNoticesReseted