class User {
  final int? userId;
  final String name;
  final String email;
  final String password;

  User({
    this.userId,
    required this.name,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      userId: data['userId'],
      name: data['name'],
      email: data['email'],
      password: data['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userId,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
