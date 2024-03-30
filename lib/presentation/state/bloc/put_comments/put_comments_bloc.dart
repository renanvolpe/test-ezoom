import 'package:bloc/bloc.dart';
import 'package:coolmovies/data/models/comments/comments.dart';
import 'package:coolmovies/data/repository/comments_repository.dart';
import 'package:meta/meta.dart';

part 'put_comments_event.dart';
part 'put_comments_state.dart';

class PutCommentsBloc extends Bloc<PutCommentsEvent, PutCommentsState> {
  PutCommentsBloc(CommentsRepository commentsRepository)
      : super(PutCommentsInitial()) {
    on<PutCommentsStarted>((event, emit) async {
      emit(PutCommentsProgress());
      var response = await commentsRepository.putComment(event.comments);
     response.fold((success) {
        //TODO USE CASE HERE
        emit(PutCommentsSuccess(success));
      }, (failure) => emit(PutCommentsFailure(failure)));
    });
  }
}
