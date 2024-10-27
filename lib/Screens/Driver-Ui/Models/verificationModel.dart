
class Verification {
  final String email;
  final String code;

  Verification({
    required this.email,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "code": code,
    };
  }
}
