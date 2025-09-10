import 'package:flutter_bloc/flutter_bloc.dart';
import 'signUp_state.dart';
import '../utils/utils.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  //emit(newState) cập nhật state, các blocLisnter và blocBuilder sẽ được thông báo
  void userNameChanged(String value) {
    emit(state.copyWith(userName: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  void firstNameChanged(String value) {
    emit(state.copyWith(firstName: value));
  }

  void lastNameChanged(String value) {
    emit(state.copyWith(lastName: value));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void signUp() {
    emit(state.copyWith(isLoading: true));

    bool isUserNameOk = Utils.isCorrectUserName(state.userName);
    bool isPasswordOk = Utils.isCorrectPassWord(state.password);
    bool isFirstNameOk = Utils.isCorrectFirstName(state.firstName);
    bool isLastNameOk = Utils.isCorrectLastName(state.lastName);
    bool isEmailOk = Utils.isCorrectEmail(state.email);

    if (isUserNameOk && isPasswordOk && isFirstNameOk && isLastNameOk && isEmailOk) {
      emit(state.copyWith(isLoading: false, isSignUpSuccess: true));
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }
}