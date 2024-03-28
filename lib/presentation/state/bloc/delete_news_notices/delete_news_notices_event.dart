// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'delete_news_notices_bloc.dart';

@immutable
sealed class DeleteNewsNoticesEvent {}

class DeleteNewsNoticesStarted extends DeleteNewsNoticesEvent {
  final String id;
  DeleteNewsNoticesStarted({
    required this.id,
  });
}
