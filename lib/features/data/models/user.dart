class User {
  final String? email;
  final String? password;
  final String name;

  User({
    this.email,
    this.password,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "name": name,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        password: json["password"],
        name: json["name"],
      );
}
