class AccountState {
  String avatarPath;
  String name;
  String email;
  String generalError;
  bool isAccessActive;

  AccountState({
    this.generalError = '',
    this.isAccessActive = true,
    required this.avatarPath,
    required this.name,
    required this.email,
  });

  AccountState copyWith({
    String? avatarPath,
    String? name,
    String? email,
    String? generalError,
    bool? isAccessActive
  }) {
    return AccountState(
      avatarPath: avatarPath ?? this.avatarPath,
      name: name ?? this.name,
      email: email ?? this.email,
      generalError: generalError ?? this.generalError,
      isAccessActive: isAccessActive ?? this.isAccessActive,
    );
  }
}