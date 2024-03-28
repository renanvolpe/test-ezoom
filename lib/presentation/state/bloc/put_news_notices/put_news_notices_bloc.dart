import 'package:bloc/bloc.dart';
import 'package:coolmovies/data/models/news/news_notices.dart';
import 'package:coolmovies/data/repository/news_notice_repository.dart';
import 'package:meta/meta.dart';

part 'put_news_notices_event.dart';
part 'put_news_notices_state.dart';

class PutNewsNoticesBloc extends Bloc<PutNewsNoticesEvent, PutNewsNoticesState> {
  PutNewsNoticesBloc(NewsNoticeRepository newsNoticeRepository)
      : super(PutNewsNoticesInitial()) {
    on<PutNewsNoticesStarted>((event, emit) async {
      emit(PutNewsNoticesProgress());
      var response = await newsNoticeRepository.updateNewsNotices(event.newsNotices);
     response.fold((success) {
        //TODO USE CASE HERE
        emit(PutNewsNoticesSuccess(success));
      }, (failure) => emit(PutNewsNoticesFailure(failure)));
    });
  }
}
