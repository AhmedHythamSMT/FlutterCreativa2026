class AuthService {
  Future<String> getUser() async {
    await Future.delayed(Duration(milliseconds: 1));
    return 'no one';
  }
}
