

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/signUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: LogIn()
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();

}

class _LogInState extends State<LogIn> {

  bool _isShowPass = false;
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passWordController = new TextEditingController();
  String _userNameErrStr = "UserName không hợp lệ";
  String _passWordErrStr = "PassWord không hợp lệ";
  bool _isCorrectUserName = true;
  bool _isCorrectPassWord = true;



  @override
  Widget build(BuildContext context) {
    //để sử dụng các matarial Widget thì phải khai báo MaterialApp
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: Center(
            child: Column(
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
                  controller: _userNameController,
                  decoration: InputDecoration(
                    errorText: _isCorrectUserName ? null : _userNameErrStr,
                    labelText: "USER NAME",
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
                      controller: _passWordController,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        obscureText: !_isShowPass,
                        decoration: InputDecoration(
                          errorText: _isCorrectPassWord ? null : _passWordErrStr,
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
                      backgroundColor: Colors.green
                    ),
                    onPressed: onLogInClick, 
                    child: Text("Log In", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
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

  void onLogInClick() {
    setState(() {
      if(_userNameController.text != "huy") {
        _isCorrectUserName = false;
      }
      else {
        _isCorrectUserName = true;
      }

      if(_passWordController.text.length < 6) {
        _isCorrectPassWord = false;
      } 
      else {
        _isCorrectPassWord = true;
      }


      if(_isCorrectPassWord && _isCorrectUserName) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }
    });
  }


  void onSignUpClick() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
  }
}


