import 'package:bloc/bloc.dart';
import 'package:coolmovies/data/models/comments/comments.dart';
import 'package:coolmovies/data/repository/comments_repository.dart';
import 'package:meta/meta.dart';

part 'get_comments_event.dart';
part 'get_comments_state.dart';

class GetCommentsBloc extends Bloc<GetCommentsEvent, GetCommentsState> {
  GetCommentsBloc(CommentsRepository commentsRepository)
      : super(GetCommentsInitial()) {
    on<GetCommentsStarted>((event, emit) async {
      emit(GetCommentsProgress());
      var response = await commentsRepository.getListComments();
     response.fold((success) {
        //TODO USE CASE HERE
        emit(GetCommentsSuccess(success));
      }, (failure) => emit(GetCommentsFailure(failure)));
    });
  }
}
