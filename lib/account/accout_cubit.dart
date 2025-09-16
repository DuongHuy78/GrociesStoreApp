import 'package:flutter_application_1/account/account_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccoutCubit extends Cubit<AccountState>{
  
  AccoutCubit() :super(AccountState(avatarPath: "assets/images/huy.JPG", name: "Le Duong Huy", email: "leduonghuy@gmail.com"));
}