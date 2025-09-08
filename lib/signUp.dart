import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class Signup extends StatefulWidget {
  @override
  _SignupPage createState() => _SignupPage();

}

class _SignupPage extends State<Signup> {

  bool _isShowPass = false; 
  bool _isAvaliableLogIn = true;
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passWordController = new TextEditingController();
  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();

  final String _userNameErrStr = "UserName không hợp lệ";
  final String _passWordErrStr = "PassWord không hợp lệ";
  final String _firstNameErrStr = "First Name không hợp lệ";
  final String _lastNameErrStr = "Last Name không hợp lệ";
  final String _emailErrStr = "Email không hợp lệ";

  bool _isCorrectUserName = true;
  bool _isCorrectPassWord = true;
  bool _isCorrectFirstName = true;
  bool _isCorrectLastName = true;
  bool _isCorrectEmail = true;



  @override
  Widget build(BuildContext context) {
    //để sử dụng các matarial Widget thì phải khai báo MaterialApp
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
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
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    errorText: _isCorrectFirstName ? null : _firstNameErrStr,
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
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    errorText: _isCorrectLastName ? null : _lastNameErrStr,
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

              //Email
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    errorText: _isCorrectEmail ? null : _emailErrStr,
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
                        child: Text(!_isShowPass? "SHOW": "HIDE",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                          ),
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
                    onPressed: onSignUpClick, 
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
    setState(() {
      if(_userNameController.text.length < 6 || _userNameController.text.contains(RegExp(r'\d'))) {
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

      if(_firstNameController.text.isEmpty) {
        _isCorrectFirstName = false;
      }
      else {
        _isCorrectFirstName = true;
      }

      if(_lastNameController.text.isEmpty) {
        _isCorrectLastName = false;
      }
      else {
        _isCorrectLastName = true;
      }

      if(_emailController.text.contains(RegExp(r'.{2,} + @gmail$'))) {
        _isCorrectEmail = false;
      }
      else {
        _isCorrectEmail = true;
      }

      if(_isCorrectPassWord && _isCorrectUserName && _isCorrectEmail && _isCorrectFirstName && _isCorrectLastName) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));      }
    });
  }

  void setStateLogIn() {
    if(!_isCorrectEmail || ! _isCorrectPassWord) {
      setState(() {
        _isAvaliableLogIn = false;
      });
    }
    else {
      setState(() {
        _isAvaliableLogIn = true;
      });
    }
  }

  void onSignInClick() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }
}


