class User {
  final String userId;
  final String name;
  final String correo;
  final String password;

  User({
    required this.userId,
    required this.name,
    required this.correo,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
        userId: data['id'],
        name: data['name'],
        correo: data['correo'],
        password: data['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userId,
      'name': name,
      'correo': correo,
      'password': password,
    };
  }
}
