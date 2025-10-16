class  SignUpState{
  final String userName;
  final String password;
  final String firstName;
  final String lastName;
  final String email;

  final String errorUsername;
  final String errorPassword;
  final String errorFirstname;
  final String errorLastname;
  final String errorEmail;

  final String generalError;

  final bool isLoading;
  final bool isSignUpSuccess;

  SignUpState({
    this.userName = '',
    this.password = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.errorUsername = '',
    this.errorPassword = '',
    this.errorFirstname = '',
    this.errorLastname = '',
    this.errorEmail = '',
    this.generalError = '',
    this.isLoading = false,
    this.isSignUpSuccess = false,
  });

  factory SignUpState.initial() => SignUpState();

  SignUpState copyWith({
    String? userName,
    String? password,
    String? firstName,
    String? lastName,
    String? email,
    String? errorUsername,
    String? errorPassword,
    String? errorFirstname,
    String? errorLastname,
    String? errorEmail,
    String? generalError,
    bool? isLoading,
    bool? isSignUpSuccess,
  }) {
    return SignUpState(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      errorUsername: errorUsername ?? this.errorUsername,
      errorPassword: errorPassword ?? this.errorPassword,
      errorFirstname: errorFirstname ?? this.errorFirstname,
      errorLastname: errorLastname ?? this.errorLastname,
      errorEmail: errorEmail ?? this.errorEmail,
      generalError: generalError ?? this.generalError,
      isLoading: isLoading ?? this.isLoading,
      isSignUpSuccess: isSignUpSuccess ?? this.isSignUpSuccess,
    );
  }
}
