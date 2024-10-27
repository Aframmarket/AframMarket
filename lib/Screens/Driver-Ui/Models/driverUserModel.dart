
class DriverSignUpModel{
  final String email;
  final String password;
  final String repeatPassword;
  final int state;

  DriverSignUpModel({
    required this.email,
    required this.password,
    required this.repeatPassword,
    this.state = 20, // Default value as specified
  });

  // Convert DriverSignUpUser object to JSON
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "repeatpassword": repeatPassword,
      "state": state,
    };
  }

  factory DriverSignUpModel.fromJson(Map<String, dynamic> json) {
    return DriverSignUpModel(
      email: json["email"],
      password: json["password"],
      repeatPassword: json["repeatpassword"],
      state: json["state"] ?? 20,
    );
  }
}