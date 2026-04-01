class UserDataClass {
  String? username;
  String email;
  String password;

  UserDataClass({required this.email, required this.password, this.username});

  UserDataClass copyWith({String? email, String? password, String? username}) {
    return UserDataClass(
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }
}
