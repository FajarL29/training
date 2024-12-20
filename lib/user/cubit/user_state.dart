part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class FecthUserLoading extends UserState {}

final class FecthUserSucces extends UserState {
  final List<UserModel> data;
  const FecthUserSucces(this.data);
}
  
final class FecthUserFailed extends UserState {
  final String message;

  const FecthUserFailed(this.message);
}