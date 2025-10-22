
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/login/data/login_request.dart';
import 'package:flutter_application_1/login/data/login_response.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:flutter_application_1/login/api/login_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit/dio.dart';
import 'login_state.dart';
import '../../utils/utils.dart';

class LoginCubit extends Cubit<LoginState>{

  LoginCubit() : super(LoginState());

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
    validateEmail(value);
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
    validatePassword(value);
  }

  void clearError() {
    emit(state.copyWith(generalError: ''));
  }

  //hàm này vì khi thoát -> login mà login vẫn còn isLoginSuccess = true
  //nên sẽ tiếp tục vào vì vậy phải set lại hoặc kiểm tra token rồi mới cho vào
  void clearSuccessState() {
    emit(state.copyWith(isLoginSuccess: false));
  }

  void clearData() {
    emit(state.copyWith(email: "", password: ""));
  }

  void validateEmail(String value) {
    if(!Utils.isCorrectEmail(value)) {
      emit(state.copyWith(errorEmail: "Vui lòng nhập đúng định dạng email"));
    }
    else {
      emit(state.copyWith(errorEmail: ''));
    }
  }

  void validatePassword(String value) {
    if(!Utils.isCorrectPassWord(value)) {
      emit(state.copyWith(errorPassword: "Vui lòng nhập mật khẩu có ít nhất 6 kí tự, chứa ít nhất 1 chữ hoa, 1 chữ thường và 1 số"));
    }
    else {
      emit(state.copyWith(errorPassword: ''));
    }
  }

  Future<void> login() async {
    emit(state.copyWith(isLoading: true, isLoginSuccess: false));
    emit(state.copyWith(generalError: ''));

    Dio dio = Dio();
    if(state.errorEmail == ''
      && state.errorPassword == '') {
        try {
          final _loginApi = LoginApi(dio);
          final LoginRequest request = LoginRequest(email: state.email, password: state.password);
          final HttpResponse<LoginResponse> response = await _loginApi.login(request);

          if(response.response.statusCode == 200) {
            Storage.saveToken(response.data.data.tokens.accessToken);
            emit(state.copyWith(isLoading: false, isLoginSuccess: true));
          }
          else{
            emit(state.copyWith(isLoading: false, isLoginSuccess: false, generalError: "Đã xảy ra lỗi vui lòng thử lại sau"));
          }
        }
        catch(e) {          emit(state.copyWith(isLoading: false, isLoginSuccess: false, generalError: e.toString()));
        }
      }
  }
}