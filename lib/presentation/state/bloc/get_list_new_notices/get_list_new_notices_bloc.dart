import 'package:bloc/bloc.dart';
import 'package:coolmovies/data/models/news/news_notices.dart';
import 'package:coolmovies/data/repository/news_notice_repository.dart';
import 'package:meta/meta.dart';

part 'get_list_new_notices_event.dart';
part 'get_list_new_notices_state.dart';

class GetListNewNoticesBloc extends Bloc<GetListNewNoticesEvent, GetListNewNoticesState> {
  GetListNewNoticesBloc(NewsNoticeRepository newsNoticeRepository)
      : super(GetListNewNoticesInitial()) {
    on<GetListNewNoticesStarted>((event, emit) async {
      emit(GetListNewNoticesProgress());
      var response = await newsNoticeRepository.getListNewsNotices();
     response.fold((success) {
        //TODO USE CASE HERE
        emit(GetListNewNoticesSuccess(success));
      }, (failure) => emit(GetListNewNoticesFailure(failure)));
    });
  }
}
