import 'dart:convert';

LoginRequestModel loginRequestModelFromJson(String str) =>
    LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) =>
    json.encode(data.toJson());

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({required this.email, required this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        email: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": email,
        "password": password,
      };
}

// class LoginRequestModel {
//   String? email;
//   String? password;

//   LoginRequestModel({
//     required this.email,
//     required this.password,
//   });

  // factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
  //     LoginRequestModel(
  //       email: json["email"] ?? '',
  //       password: json["password"] ?? '',
  //     );

  // Map<String, dynamic> toJson() => {
  //       "email": email,
  //       "password": password,
  //     };
// }
