
class LoginState {
  String email;
  String password;
  String generalError;
  String errorEmail;
  String errorPassword;
  bool isLoading;
  bool isLoginSuccess;

  LoginState({
    this.email = '',
    this.password = '',
    this.generalError = '',
    this.errorEmail = '',
    this.errorPassword = '',
    this.isLoading = false,
    this.isLoginSuccess = false,
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? generalError,
    String? errorEmail,
    String? errorPassword,
    bool? isLoading,
    bool? isLoginSuccess
  }) {
    return LoginState(
      email: email ?? this.email, 
      password: password ?? this.password, 
      generalError: generalError ?? this.generalError,
      errorEmail: errorEmail ?? this.errorEmail,
      errorPassword: errorPassword ?? this.errorPassword,
      isLoading: isLoading ?? this.isLoading, 
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess
    );
  }
}