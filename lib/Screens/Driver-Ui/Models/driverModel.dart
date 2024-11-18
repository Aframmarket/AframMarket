
class DriverModel {
  String? firstname;
  String? lastname;
  String? businessname;
  String? businessaddress;
  String? zipcode;
  String? city;
  String? state;
  String? vehicleType;
  String? email;
  String? phone;
  String? userid;

  DriverModel(
      {this.firstname,
      this.lastname,
      this.businessname,
      this.businessaddress,
      this.zipcode,
      this.city,
      this.state,
      this.vehicleType,
      this.email,
      this.phone,
      this.userid});

  DriverModel.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    businessname = json['businessname'];
    businessaddress = json['businessaddress'];
    zipcode = json['zipcode'];
    city = json['city'];
    state = json['state'];
    vehicleType = json['vehicle_type'];
    email = json['email'];
    phone = json['phone'];
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['businessname'] = businessname;
    data['businessaddress'] = businessaddress;
    data['zipcode'] = zipcode;
    data['city'] = city;
    data['state'] = state;
    data['vehicle_type'] = vehicleType;
    data['email'] = email;
    data['phone'] = phone;
    data['userid'] = userid;
    return data;
  }
}
