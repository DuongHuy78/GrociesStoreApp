class SignUpState {
  String userName;
  String password;
  String firstName;
  String lastName;
  String email;
  bool isLoading;
  bool isSignUpSuccess;

  SignUpState({
    this.userName = '',
    this.password = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.isLoading = false,
    this.isSignUpSuccess = false,
  });

  SignUpState copyWith({
    String? userName,
    String? password,
    String? firstName,
    String? lastName,
    String? email,
    bool? isLoading,
    bool? isSignUpSuccess,
  }) {
    return SignUpState(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
      isSignUpSuccess: isSignUpSuccess ?? this.isSignUpSuccess,
    );
  }
}