// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'post_news_notices_bloc.dart';

@immutable
sealed class PostNewsNoticesEvent {}

class PostNewsNoticesStarted extends PostNewsNoticesEvent {
  final NewsNotices newsNotices;
  PostNewsNoticesStarted({
    required this.newsNotices,
  });
}
