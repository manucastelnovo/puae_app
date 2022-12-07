class User {
  final String userId;
  final String name;
  final String email;
  final String password;
  final String userType;
  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.userType,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
        userId: data['id'],
        name: data['name'],
        email: data['email'],
        password: data['password'],
        userType: data['userType']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userId,
      'name': name,
      'email': email,
      'password': password,
      'userType': userType,
    };
  }
}
