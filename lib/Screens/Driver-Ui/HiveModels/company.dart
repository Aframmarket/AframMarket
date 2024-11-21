
import 'package:hive/hive.dart';
import 'upload.dart';

part 'company.g.dart';

@HiveType(typeId: 1)
class Company extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String businessName;

  @HiveField(2)
  String address;

  @HiveField(3)
  String city;

  @HiveField(4)
  String state;

  @HiveField(5)
  String zipCode;

  @HiveField(6)
  int categories;

  @HiveField(7)
  String bankName;

  @HiveField(8)
  String accountNo;

  @HiveField(9)
  String accountName;

  @HiveField(10)
  int userId;

  @HiveField(11)
  int status;

  @HiveField(12)
  String dateCreated;

  @HiveField(13)
  String statusUpdateDate;

  @HiveField(14)
  String wallet;

  @HiveField(15)
  String paypalEmail;

  @HiveField(16)
  String vehicleType;

  @HiveField(17)
  int hasAgreed;

  @HiveField(18)
  String firstname;

  @HiveField(19)
  String lastname;

  @HiveField(20)
  List<Upload> uploads;

  Company({
    required this.id,
    required this.businessName,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.categories,
    required this.bankName,
    required this.accountNo,
    required this.accountName,
    required this.userId,
    required this.status,
    required this.dateCreated,
    required this.statusUpdateDate,
    required this.wallet,
    required this.paypalEmail,
    required this.vehicleType,
    required this.hasAgreed,
    required this.firstname,
    required this.lastname,
    required this.uploads,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json['id'],
    businessName: json['business_name'],
    address: json['address'],
    city: json['city'],
    state: json['state'].toString(),
    zipCode: json['zip_code'],
    categories: json['categories'],
    bankName: json['bank_name'],
    accountNo: json['account_no'],
    accountName: json['account_name'],
    userId: json['user_id'],
    status: json['status'],
    dateCreated: json['date_created'],
    statusUpdateDate: json['status_update_date'],
    wallet: json['wallet'],
    paypalEmail: json['paypal_email'],
    vehicleType: json['vehicle_type'],
    hasAgreed: json['has_agreed'],
    firstname: json['firstname'],
    lastname: json['lastname'],
    uploads: (json['uploads'] as List)
        .map((e) => Upload.fromJson(e))
        .toList(),
  );
}
