class AuthenticationController {
  bool verifyEmail(String email) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  bool verifyPassword(String password) {
    String pattern = r'^(?=.*[A-Z])(?=.*\d).+$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }
}
