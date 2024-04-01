import 'package:bloc/bloc.dart';
import 'package:coolmovies/data/repository/comments_repository.dart';
import 'package:meta/meta.dart';

part 'delete_comments_event.dart';
part 'delete_comments_state.dart';

class DeleteCommentsBloc extends Bloc<DeleteCommentsEvent, DeleteCommentsState> {
  DeleteCommentsBloc(CommentsRepository commentsRepository)
      : super(DeleteCommentsInitial()) {
    on<DeleteCommentsStarted>((event, emit) async {
      emit(DeleteCommentsProgress(event.id));
      var response = await commentsRepository.deleteComment(event.id);
     response.fold((success) {
        //TODO USE CASE HERE
        emit(DeleteCommentsSuccess(success));
      }, (failure) => emit(DeleteCommentsFailure(failure)));
    });
  }
}

