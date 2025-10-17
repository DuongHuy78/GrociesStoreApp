import 'package:dio/dio.dart';
import 'package:flutter_application_1/signUp/data/signUp_request.dart';
import 'package:flutter_application_1/signUp/data/signUp_reseponse.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signUp_state.dart';
import '../../utils/utils.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  final Dio dio = Dio();

  //emit(newState) cập nhật state, các blocLisnter và blocBuilder sẽ được thông báo
  void userNameChanged(String value) {
      emit(state.copyWith(userName: value, errorUsername: ''));

  }

  void passwordChanged(String value) {
      emit(state.copyWith(password: value, errorPassword: ''));

  }

  void firstNameChanged(String value) {
      emit(state.copyWith(firstName: value, errorFirstname: ''));
  }

  void lastNameChanged(String value) {
      emit(state.copyWith(lastName: value, errorLastname: ''));
  }

  void emailChanged(String value) {

      emit(state.copyWith(email: value, errorEmail: ''));
  }

  void validateUsername(String value) {
    if (!Utils.isCorrectUserName(value)) {
        emit(state.copyWith(errorUsername: "Username không hợp lệ"));
    } else {
      emit(state.copyWith(errorUsername: ''));
    }
  }

  void validatePassword(String value) {
    if (!Utils.isCorrectPassWord(value)) {
        emit(state.copyWith(errorPassword: "Password không hợp lệ"));
    } else {
        emit(state.copyWith(errorPassword: ''));
    }
  }

  void validateFirstname(String value) {
    if (!Utils.isCorrectFirstName(value)) {
      emit(state.copyWith(errorFirstname: "Firstname không hợp lệ"));
    } else {
      emit(state.copyWith(errorFirstname: ''));
    }
  }

  void validateLastname(String value) {
    if (!Utils.isCorrectLastName(value)) {
      emit(state.copyWith(errorLastname: "Lastname không hợp lệ"));
    } else {
      emit(state.copyWith(errorLastname: ''));
    }
  }

  void validateEmail(String value) {
    if (!Utils.isCorrectEmail(value)) {
      emit(state.copyWith(errorEmail: "Email không hợp lệ"));
    } else {
      emit(state.copyWith(errorEmail: ''));
    }
  }

  void clearError() {
      emit(state.copyWith(generalError: ''));
  }

  Future<void> signUp() async{

    if (state.errorEmail == ''
      && state.errorUsername == ''
      && state.errorPassword == ''
      && state.errorFirstname == ''
      && state.errorLastname == '') {
        try {

          emit(state.copyWith(isLoading: true));

          final response = await dio.post(
            "https://us-central1-skin-scanner-3c419.cloudfunctions.net/base/v1/auth-service/register",
            data: SignupRequest(
              username: state.userName,
              email: state.email,
              firstName: state.firstName,
              lastName: state.lastName,
              password: state.password,
            ).toJson(),
          );

          if(response.statusCode == 201) {
            emit(state.copyWith(isLoading: false, isSignUpSuccess: true));
          } else {
            emit(state.copyWith(isLoading: false, isSignUpSuccess: false));
          }

        } catch(e) {
          emit(state.copyWith(isLoading: false, isSignUpSuccess: false, generalError: e.toString()));
        }
      }
  }
}
