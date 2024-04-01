// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'delete_comments_bloc.dart';

@immutable
sealed class DeleteCommentsEvent {}

class DeleteCommentsStarted extends DeleteCommentsEvent {
  final String id;
  DeleteCommentsStarted({
    required this.id,
  });
}
