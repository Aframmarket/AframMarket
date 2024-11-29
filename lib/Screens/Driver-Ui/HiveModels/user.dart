
import 'package:hive/hive.dart';
import 'company.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String firstname;

  @HiveField(2)
  String lastname;

  @HiveField(3)
  String email;

  @HiveField(4)
  String phone;

  @HiveField(5)
  String role;

  @HiveField(6)
  String dateCreated;

  @HiveField(7)
  Company company;

  @HiveField(8)
  String? profilePicturePath; // Add this line

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.role,
    required this.dateCreated,
    required this.company,
    this.profilePicturePath
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    firstname: json['firstname'],
    lastname: json['lastname'],
    email: json['email'],
    phone: json['phone'],
    role: json['role'],
    dateCreated: json['date_created'],
    company: Company.fromJson(json['company']),
    profilePicturePath: json['profile_picture_path'],
  );
}
