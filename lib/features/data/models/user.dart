class User {
  String email;
  String password;

  User({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        password: json["password"],
      );
}
