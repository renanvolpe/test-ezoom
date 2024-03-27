import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_index_state.dart';

class BottomNavigationIndexCubit extends Cubit<int> {
  BottomNavigationIndexCubit() : super(0);

  changeNav(int value)=>emit (value);
}
