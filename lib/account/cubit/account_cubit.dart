import 'package:dio/dio.dart';
import 'package:flutter_application_1/account/api/account_api.dart';
import 'package:flutter_application_1/account/cubit/account_state.dart';
import 'package:flutter_application_1/account/data/account_response.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit/retrofit.dart';

class AccountCubit extends Cubit<AccountState>{
  
  AccountCubit() :super(AccountState(avatarPath: "assets/images/defaultUser.png", name: "Đang tải", email: "Đang tải")); 

  void clearError() {
    emit(state.copyWith(generalError: ''));
  }

  Future<void> fetchAccount() async {
    Dio dio = Dio();
    final String? token = await Storage.getToken();
    if(token == null || token.isEmpty) {
      emit(state.copyWith(isAccessActive: false));
    }
    else {
      emit(state.copyWith(isAccessActive: true));
    }
    

    try {
      // Response response = await dio.get(
      //   "https://us-central1-skin-scanner-3c419.cloudfunctions.net/base/v1/user-service/me",
      //   options: Options(
      //     headers: {'Authorization' : 'Bearer $token'}
      //   )
      // );
      Dio dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $token';
      print(token);

      AccountApi _accountApi = AccountApi(dio);
      final HttpResponse<AccountResponse> response = await _accountApi.getInfor();

      if(response.response.statusCode == 200) {
        emit(state.copyWith(
          email: response.data.data.userInfo.email, 
          name:response.data.data.userInfo.username, 
          avatarPath: response.data.data.userInfo.profilePic
        ));
      }
      else {
        emit(state.copyWith(generalError: "Mã lỗi:  + ${response.response.statusCode}"));
      }
    }
    catch(e) {
      emit(state.copyWith(generalError: e.toString()));
    }
  } 

  Future<void> deleteToken() async {
    Storage.removeToken();
  }
}