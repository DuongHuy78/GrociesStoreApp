class SignupRequest {
  String username;
  String password;
  String firstName;
  String lastName;
  String email;

  SignupRequest({
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "password": password,
    };
  }
}