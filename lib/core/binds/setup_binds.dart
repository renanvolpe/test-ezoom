import 'package:coolmovies/data/repository/dio.dart';
import 'package:coolmovies/data/repository/news_notice_repository.dart';
import 'package:coolmovies/presentation/state/bloc/get_list_new_notices/get_list_new_notices_bloc.dart';
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

    //bloc
    binds.registerSingleton(GetListNewNoticesBloc(binds.get<NewsNoticeRepository>()));

    //cubits
    binds.registerSingleton(BottomNavigationIndexCubit());

    // _checkBind(BottomNavigationIndexCubit());
  }

  static void disposeBindsHome() {
    //dio and dependencies
    binds.unregister<Dio>();

    binds.unregister<DioClient>();

    //repositories
     binds.unregister<NewsNoticeRepository>();

    //bloc
     binds.unregister<GetListNewNoticesBloc>();

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
