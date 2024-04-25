class User {
  int id;
  String phoneNumber;
  String email;
  String firstName;
  String lastName;
  String password;
  int photo_id;
  int code;
  String token;

  User(
      {required this.id,
      required this.phoneNumber,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.password,
      required this.photo_id,
      required this.code,
      required this.token});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      password: json['password'],
      photo_id: json['photo_id'],
      code: json['code'],
      token: json['token']);
}