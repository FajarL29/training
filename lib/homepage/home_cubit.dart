import 'package:bloc/bloc.dart';

class HomePageCubit extends Cubit<int> {
  HomePageCubit() : super(0);

  /// Add 1 to the current state.
  void increment() => emit(state + 1);

  /// Add 1 to the current state.
  void decrement() => emit(state - 1);
}
