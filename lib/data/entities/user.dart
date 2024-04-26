class User {
  // int id;
  String phoneNumber;
  String email;
  String firstName;
  String lastName;
  String? password;
  int? photo_id;

  User(
      {
        // required this.id,
      required this.phoneNumber,
      required this.email,
      required this.firstName,
      required this.lastName,
     this.password,
       this.photo_id,});

  factory User.fromJson(Map<String, dynamic> json) => User(
      // id: json['id'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      password: json['password'],
      photo_id: json['photo_id'],
      );
}