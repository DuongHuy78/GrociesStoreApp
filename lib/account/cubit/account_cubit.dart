import 'package:dio/dio.dart';
import 'package:flutter_application_1/account/cubit/account_state.dart';
import 'package:flutter_application_1/account/data/account_response.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      Response response = await dio.get(
        "https://us-central1-skin-scanner-3c419.cloudfunctions.net/base/v1/user-service/me",
        options: Options(
          headers: {'Authorization' : 'Bearer $token'}
        )
      );

      if(response.statusCode == 200) {
        AccountResponse accountResponse = AccountResponse.fromJson(response.data);
        emit(state.copyWith(
          email: accountResponse.email, 
          name:accountResponse.username, 
          avatarPath: accountResponse.avatarPath
        ));
        print("owr dayyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
        print(accountResponse.avatarPath);
      }
      else {
        emit(state.copyWith(generalError: "Mã lỗi:  + ${response.statusCode}"));
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