class User{
  final String userName;
  final String userEmail;
  final String userPassword;

  User({required this.userName, required this.userEmail, required this.userPassword});
  @override
  String toString() {
    return "{$userName, $userEmail, $userPassword}";
  }
}