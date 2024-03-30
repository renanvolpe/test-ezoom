import 'package:bloc/bloc.dart';
import 'package:coolmovies/data/models/comments/comments.dart';
import 'package:coolmovies/data/repository/comments_repository.dart';
import 'package:meta/meta.dart';

part 'post_comments_event.dart';
part 'post_comments_state.dart';

class PostCommentsBloc extends Bloc<PostCommentsEvent, PostCommentsState> {
  PostCommentsBloc(CommentsRepository commentsRepository)
      : super(PostCommentsInitial()) {
    on<PostCommentsStarted>((event, emit) async {
      emit(PostCommentsProgress());
      var response = await commentsRepository.postComments(event.comments);
     response.fold((success) {
        //TODO USE CASE HERE
        emit(PostCommentsSuccess(success));
      }, (failure) => emit(PostCommentsFailure(failure)));
    });
  }
}
