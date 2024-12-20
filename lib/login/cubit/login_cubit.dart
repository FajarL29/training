import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  var dataDummy = {
    'username': 'tmmin@toyota.com',
    'password': 'goodthinkinggoodproduct'
  };
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;

  void login() {
    emit(LoginLoading());
    // check inputan

    if (emailController.text == dataDummy['username'] &&
        passwordController.text == dataDummy['password']) {
      Future.delayed(const Duration(seconds: 1), () {
        emit(LoginSuccess('Login Success'));
      });
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        emit(LoginFailed('Login Failed, Please try again'));
      });
    }
  }

  void togglePassword() {
    hidePassword = !hidePassword;
    emit(LoginInitial());
  }
}
