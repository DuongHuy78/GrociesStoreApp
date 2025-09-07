

import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/login_cubit.dart';
import 'package:flutter_application_1/cubit/login_state.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/signUp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => LoginCubit(),
        child: MaterialApp(
          home: LogIn(),
        )
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();

}

class _LogInState extends State<LogIn> {

  bool _isShowPass = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passWordController = new TextEditingController();
  final String _emailErrStr = "Vui lòng nhập đúng định dạng email";
  final String _passWordErrStr = "Vui lòng nhập mật khẩu có ít nhất 6 kí tự, chứa ít nhất 1 chữ hoa, 1 chữ thường và 1 số";
  bool isEmailToched = false;
  bool isPassWordToched = false;


  @override
  Widget build(BuildContext context) {
    //để sử dụng các matarial Widget thì phải khai báo MaterialApp
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state.isLoginSuccess) {
           Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: Center(
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: Image.asset('assets/images/logo_ca_rot.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text("Log in", style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                      child: Text("Enter your emails and password", 
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ),
                        
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: TextField(
                        onChanged:(value) {
                              if(!isEmailToched) {
                                setState(() {
                                  isEmailToched = true;
                                });
                              }
                              context.read<LoginCubit>().emailChanged(value);
                              
                            },
                        controller: _emailController,
                        
                        decoration: InputDecoration(
                          errorText: !Utils.isCorrectEmail(state.email) && isEmailToched? _emailErrStr: null,
                          labelText: "EMAIL",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                        
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: <Widget>[
                          TextField(
                            onChanged:(value) {
                              if(!isPassWordToched) {
                                setState(() {
                                  isPassWordToched = true;
                                });
                              }
                              context.read<LoginCubit>().passwordChanged(value);
                              
                            },
                            controller: _passWordController,
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              obscureText: !_isShowPass,
                              decoration: InputDecoration(
                                errorText: !Utils.isCorrectPassWord(state.password) && isPassWordToched? _passWordErrStr: null,
                                labelText: "PASSWORD",
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                      
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: GestureDetector(
                              onTap: showPass ,
                              child: IconButton(
                                onPressed: showPass,
                                icon: _isShowPass? Image.asset('assets/images/icons8-eye-24.png'): Image.asset('assets/images/icons8-invisible-24.png')
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 15),
                      child: Container(
                        alignment: AlignmentDirectional.centerEnd,
                        child: 
                          Text("Forgot Password?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),),
                      
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: SizedBox(
                        width: double.infinity,
                        height: 67,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: state.email.isNotEmpty && state.password.isNotEmpty
                            ? Colors.green
                            : Colors.grey,

                          ),
                          onPressed:(state.email.isNotEmpty && state.password.isNotEmpty)
                            ? () {
                                context.read<LoginCubit>().login();
                              }
                            : null,
                          child: Text(
                            "Log In", 
                            style: TextStyle(color: Colors.white, 
                              fontSize: 18, fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                        
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have an account?",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        
                        GestureDetector(
                          onTap: onSignUpClick,
                          child: Text(" Sign Up",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );

              }
            ),
          ),
        ),
      ),
    );
  }

  void showPass() {
    setState(() {
      _isShowPass = !_isShowPass;
    });
  }

  void onSignUpClick() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
  }
}


