
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';
import '../utils/utils.dart';

class LoginCubit extends Cubit<LoginState>{

  LoginCubit() : super(LoginState());

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  Future<void> login() async {
    bool isCorrectPassWord = false;
    bool isCorrectEmail = false;
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Duration(seconds: 2)); // Delay 2 giây
    if(Utils.isCorrectEmail(state.email.toString())) {
      isCorrectEmail = true;
    }
    if(Utils.isCorrectPassWord(state.password)) {
      isCorrectPassWord = true;
    } 
    
    if(isCorrectEmail && isCorrectPassWord) {
      emit(state.copyWith(isLoading: false, isLoginSuccess: true));
    }
  }
}