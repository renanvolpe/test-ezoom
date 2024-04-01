import 'package:bloc/bloc.dart';
import 'package:coolmovies/data/repository/news_notice_repository.dart';
import 'package:meta/meta.dart';

part 'delete_news_notices_event.dart';
part 'delete_news_notices_state.dart';

class DeleteNewsNoticesBloc extends Bloc<DeleteNewsNoticesEvent, DeleteNewsNoticesState> {
  DeleteNewsNoticesBloc(NewsNoticeRepository newsNoticeRepository) : super(DeleteNewsNoticesInitial()) {
    on<DeleteNewsNoticesStarted>((event, emit) async {
      emit(DeleteNewsNoticesProgress());
      var response = await newsNoticeRepository.deleteNewsNotices(event.id);
      response.fold((success) {
        //TODO USE CASE HERE
        emit(DeleteNewsNoticesSuccess(success));
      }, (failure) => emit(DeleteNewsNoticesFailure(failure)));
    });
    on<DeleteNewsNoticesReseted>((event, emit) async{
      emit(DeleteNewsNoticesInitial());
    });
  }
}
