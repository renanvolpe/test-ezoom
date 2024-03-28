import 'package:coolmovies/presentation/state/cubit/cubit/bottom_navigation_index_cubit.dart';
import 'package:get_it/get_it.dart';

final binds = GetIt.I;

class SetupBinds {
  static void setupBindsAuth() {}

  static void setupBindsHome() {
    // GetIt.I.registerSingleton(BottomNavigationIndexCubit());
    _checkBind(BottomNavigationIndexCubit());

  }
  

  
  static void _checkBind<T extends Object>( T instance) {
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
