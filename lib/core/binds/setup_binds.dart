import 'package:coolmovies/data/repository/comments_repository.dart';
import 'package:coolmovies/data/repository/dio.dart';
import 'package:coolmovies/data/repository/news_notice_repository.dart';
import 'package:coolmovies/presentation/state/bloc/delete_news_notices/delete_news_notices_bloc.dart';
import 'package:coolmovies/presentation/state/bloc/get_list_new_notices/get_list_new_notices_bloc.dart';
import 'package:coolmovies/presentation/state/bloc/post_news_notices/post_news_notices_bloc.dart';
import 'package:coolmovies/presentation/state/bloc/put_news_notices/put_news_notices_bloc.dart';
import 'package:coolmovies/presentation/state/cubit/cubit/bottom_navigation_index_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final binds = GetIt.I;

class SetupBinds {
  static void setupBindsAuth() {}

  static void setupBindsHome() {
    //dio and dependencies
    binds.registerSingleton(Dio());
    binds.registerSingleton(DioClient(binds.get<Dio>()));

    //repositories
    binds.registerSingleton(NewsNoticeRepository(binds.get<DioClient>()));

    //BLOCs
    binds.registerSingleton(GetListNewNoticesBloc(binds.get<NewsNoticeRepository>()));
    binds.registerSingleton(PutNewsNoticesBloc(binds.get<NewsNoticeRepository>()));
    binds.registerSingleton(PostNewsNoticesBloc(binds.get<NewsNoticeRepository>()));
    binds.registerSingleton(DeleteNewsNoticesBloc(binds.get<NewsNoticeRepository>()));

    //CUBITs
    binds.registerSingleton(BottomNavigationIndexCubit());

    // _checkBind(BottomNavigationIndexCubit());
  }

  //when notices started
   static void setupBindsComments(String idNews) {
    //dio and dependencies
  

    //repositories
    binds.registerSingleton(CommentsRepository(binds.get<DioClient>(), idNews));

    //BLOCs
    

    //CUBITs

    // _checkBind(BottomNavigationIndexCubit());
  }

  static void disposeBindsComments(){}

  static void disposeBindsHome() {
    //dio and dependencies
    binds.unregister<Dio>();

    binds.unregister<DioClient>();

    //repositories
    binds.unregister<NewsNoticeRepository>();

    //bloc
    binds.unregister<GetListNewNoticesBloc>();
    binds.unregister<PutNewsNoticesBloc>();
    binds.unregister<PostNewsNoticesBloc>();
    binds.unregister<DeleteNewsNoticesBloc>();

    //cubits
    binds.unregister<BottomNavigationIndexCubit>();

    // _checkBind(BottomNavigationIndexCubit());
  }

  static void _checkBind<T extends Object>(T instance) {
    if (!binds.isRegistered<T>()) {
      binds.registerSingleton<T>(instance);
    }
  }
}



  // if (GetIt.I.isRegistered<Profile>()) {
  //     GetIt.I.get<Profile>().setNewProfile(profile); // updateBind
  //   } else {
  //     GetIt.instance.registerSingleton<Profile>(profile);
  //   }
