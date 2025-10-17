class LoginResponse {
  String accessToken;

  LoginResponse({
    required this.accessToken
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(accessToken: json['data']['tokens']['accessToken']);
  }
}