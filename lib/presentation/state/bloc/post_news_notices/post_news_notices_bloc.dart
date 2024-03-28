import 'package:bloc/bloc.dart';
import 'package:coolmovies/data/models/news/news_notices.dart';
import 'package:coolmovies/data/repository/news_notice_repository.dart';
import 'package:meta/meta.dart';

part 'post_news_notices_event.dart';
part 'post_news_notices_state.dart';

class PostNewsNoticesBloc extends Bloc<PostNewsNoticesEvent, PostNewsNoticesState> {
  PostNewsNoticesBloc(NewsNoticeRepository newsNoticeRepository)
      : super(PostNewsNoticesInitial()) {
    on<PostNewsNoticesStarted>((event, emit) async {
      emit(PostNewsNoticesProgress());
      var response = await newsNoticeRepository.postNewsNotices(event.newsNotices);
     response.fold((success) {
        //TODO USE CASE HERE
        emit(PostNewsNoticesSuccess("success"));
      }, (failure) => emit(PostNewsNoticesFailure(failure)));
    });
  }
}
