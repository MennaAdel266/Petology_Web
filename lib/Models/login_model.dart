class LoginModel
{
  bool status;
  String message;
  UserData data;

  LoginModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json ['data']) : null;
  }
}

class UserData
{
  int id;
  String firstName;
  String lastName;
  String email;
  String country;
  String phone;
  int points;
  int credit;
  String token;

  // UserData({
  //   this.id,
  //   this.name,
  //   this.email,
  //   this.phone,
  //   this.image,
  //   this.points,
  //   this.credit,
  //   this.token,
  // });
  // named constructor
  UserData.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    country = json['country'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }


}