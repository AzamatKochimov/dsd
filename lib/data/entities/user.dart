class User {
  int id;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String? password;
  String? photo_url;

  User({
    required this.id,
    required this.phoneNumber,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.password,
    this.photo_url,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        password: json['password'],
        photo_url: json['photo_url'],
      );

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, email: $email, password: $password, photo_url: $photo_url}';
  }
}
