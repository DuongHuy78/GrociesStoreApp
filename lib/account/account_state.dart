class AccountState {
  String avatarPath;
  String name;
  String email;


  AccountState({
    required this.avatarPath,
    required this.name,
    required this.email,
  });

  AccountState copyWith({
    String? avatarPath,
    String? name,
    String? email,
  }) {
    return AccountState(
      avatarPath: avatarPath ?? this.avatarPath,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}