
import 'login/logIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (_) => LoginCubit()),
    //   ],
    return BlocProvider(
      create: (_) => LoginCubit(),
        child: MaterialApp(
          home: LogIn(),
        )
    );
  }
}