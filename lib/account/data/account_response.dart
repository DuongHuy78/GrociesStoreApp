class AccountResponse {
  String username;
  String email;
  String avatarPath;

  AccountResponse({
    required this.email,
    required this.username,
    required this.avatarPath
  });

  factory AccountResponse.fromJson(Map<String, dynamic> json) {
    return AccountResponse(
      email: json["data"]["userInfo"]["email"], 
      username: json["data"]["userInfo"]["username"],
      avatarPath: json["data"]["userInfo"]["profilePic"]);
  }
}