import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_latihan/user/model/user_model.dart';
import 'package:flutter_latihan/user/repository/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  UserRepository repository = UserRepository();

  void getUserList()async{
    emit(FecthUserLoading());
    try {
      final result = await repository.fecthUsers();
      emit(FecthUserSucces(result));
    } catch (e) {
      emit(FecthUserFailed(
        e.toString()
      )
      );
      
    }
  }
}
