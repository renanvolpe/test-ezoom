part of 'get_list_new_notices_bloc.dart';

@immutable
sealed class GetListNewNoticesState {}

final class GetListNewNoticesInitial extends GetListNewNoticesState {}
final class GetListNewNoticesProgress extends GetListNewNoticesState {}
final class GetListNewNoticesSuccess extends GetListNewNoticesState {
  final List<NewsNotices> listNewsNotices;
  GetListNewNoticesSuccess(this.listNewsNotices);
}
final class GetListNewNoticesFailure extends GetListNewNoticesState {
  final String message;
  GetListNewNoticesFailure(this.message);
}
