
class LoginState {
  String email;
  String password;
  bool isLoading;
  bool isLoginSuccess;

  LoginState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.isLoginSuccess = false,
  });

  LoginState copyWith({
    String? email,
    String ? password,
    bool? isLoading,
    bool? isLoginSuccess
  }) {
    return LoginState(
      email: email ?? this.email, 
      password: password ?? this.password, 
      isLoading: isLoading ?? this.isLoading, 
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess
    );
  }
}