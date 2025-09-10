import 'package:flutter/material.dart';
import 'package:flutter_application_1/signUp/signUp_cubit.dart';
import 'package:flutter_application_1/signUp/signUp_state.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signup extends StatefulWidget {
  @override
  _SignupPage createState() => _SignupPage();

}

class _SignupPage extends State<Signup> {

  bool _isShowPass = false; 
  bool _isFirstNameToched = false;
  bool _isLastNameTouched = false;
  bool _isUserNameTouched = false;
  bool _isEmailTouched = false;
  bool _isPassWordTouched = false;

  bool _isFirstNameCorrect = false;
  bool _isLastNameCorrect = false;
  bool _isUserNameCorrect = false;
  bool _isEmailCorrect = false;
  bool _isPassWordCorrect = false;

  final String _userNameErrStr = "UserName không hợp lệ";
  final String _passWordErrStr = "PassWord không hợp lệ";
  final String _firstNameErrStr = "First Name không hợp lệ";
  final String _lastNameErrStr = "Last Name không hợp lệ";
  final String _emailErrStr = "Email không hợp lệ";

  @override
  Widget build(BuildContext context) {
    //để sử dụng các matarial Widget thì phải khai báo MaterialApp
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if(state.isSignUpSuccess) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp())); 
          }
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: Center(
                child: BlocBuilder<SignUpCubit, SignUpState>(
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
                          child: Text("Sign Up", style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text("Enter your credentials to continue", 
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        
                        //First Name
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                          child: TextField(
                            onChanged: (value) {
                              _isFirstNameToched = true;
                              _isFirstNameCorrect = Utils.isCorrectFirstName(value);
                              context.read<SignUpCubit>().firstNameChanged(value);
                            },
                            decoration: InputDecoration(
                              errorText: !_isFirstNameCorrect && _isFirstNameToched ? _firstNameErrStr : null,
                              labelText: "FIRST NAME",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                              
                        //Last Name
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                          child: TextField(
                            onChanged: (value) {
                              _isLastNameTouched = true;
                              context.read<SignUpCubit>().lastNameChanged(value);
                              _isLastNameCorrect = Utils.isCorrectLastName(value);
                            },
                            decoration: InputDecoration(
                              errorText: !_isLastNameCorrect && _isLastNameTouched ? _lastNameErrStr : null,
                              labelText: "LAST NAME",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                              
                        //User Name
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                          child: TextField(
                            onChanged: (value) {
                              _isUserNameTouched = true;
                              context.read<SignUpCubit>().userNameChanged(value);
                              _isUserNameCorrect = Utils.isCorrectUserName(value);
                            },
                            decoration: InputDecoration(
                              errorText: !_isUserNameCorrect && _isUserNameTouched ? _userNameErrStr : null,
                              labelText: "USER NAME",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                              
                        //Email
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                          child: TextField(
                            onChanged: (value) {
                              _isEmailTouched = true;
                              context.read<SignUpCubit>().emailChanged(value);
                              _isEmailCorrect = Utils.isCorrectEmail(value);
                            },
                            decoration: InputDecoration(
                              errorText: !_isEmailCorrect && _isEmailTouched ? _emailErrStr : null,
                              labelText: "EMAIL",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                              border: UnderlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                              
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                          child: Stack(
                            alignment: AlignmentDirectional.centerEnd,
                            children: <Widget>[
                              TextField(
                                onChanged: (value) {
                                  _isPassWordTouched = true;
                                  context.read<SignUpCubit>().passwordChanged(value);
                                  _isPassWordCorrect = Utils.isCorrectPassWord(value);
                                },
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                  obscureText: !_isShowPass,
                                  decoration: InputDecoration(
                                    errorText: !_isPassWordCorrect && _isPassWordTouched ? _passWordErrStr : null,
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
                                    icon: _isShowPass
                                      ? Image.asset('assets/images/icons8-eye-24.png')
                                      : Image.asset('assets/images/icons8-invisible-24.png')
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(text: "By continuing you agree to our "),
                                  TextSpan(
                                    text: "Terms of Service",
                                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
                                  ),
                                  TextSpan(text: "\nand "),
                                  TextSpan(
                                    text: "Privacy Policy.",
                                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
                                  ),
                              ]
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                          child: SizedBox(
                            width: double.infinity,
                            height: 67,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green
                              ),
                              onPressed: (_isFirstNameCorrect && _isLastNameCorrect && _isUserNameCorrect && _isEmailCorrect && _isPassWordCorrect)
                                ? context.read<SignUpCubit>().signUp
                                : null, 
                              child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                            ),
                          ),
                        ),
                              
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                            
                            //chỉ dùng để bắt các thao tác và không có giao diện như button
                            GestureDetector(
                              onTap: onSignInClick,
                              child: Text(" Sign In",
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

                  },
                ),
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

  void onSignInClick() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }
}


