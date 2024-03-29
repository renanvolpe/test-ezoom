// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_list_new_notices_bloc.dart';

@immutable
sealed class GetListNewNoticesEvent {}

class GetListNewNoticesStarted extends GetListNewNoticesEvent {}

class GetListNewNoticesFiltredByTitle extends GetListNewNoticesEvent {
  final String text;
  GetListNewNoticesFiltredByTitle({
    required this.text,
  });
}
