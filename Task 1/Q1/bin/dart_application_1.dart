void main(List<String> arguments) {
  String username = "student";
  String password = "iti123";
  bool isAccountActive = true;

  // (username, password, isAccountActive) => userVerification(
  //   username: username,
  //   password: password,
  //   isAccountActive: isAccountActive,
  // );
  print(
    userVerification(
      username: username,
      password: password,
      isAccountActive: isAccountActive,
    ),
  );
}

String userVerification({
  required String username,
  required String password,
  bool? isAccountActive,
}) {
  String message = (isAccountActive == true)
      ? "Login Successful"
      : "Access Denied";
  if (username.isEmpty || password.isEmpty) print("Invalid username");
  return "$message Welcome, $username!.";
}
