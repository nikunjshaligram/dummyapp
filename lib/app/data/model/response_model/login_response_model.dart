class LoginResponseModel {
  LoginResponseModel({
    required this.code,
    required this.message,
    required this.data,
  });
  late final int code;
  late final String message;
  late final LoginData data;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = LoginData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class LoginData {
  LoginData({
    required this.Id,
    required this.Name,
    required this.Email,
    required this.Token,
  });
  late final int Id;
  late final String Name;
  late final String Email;
  late final String Token;

  LoginData.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Name = json['Name'];
    Email = json['Email'];
    Token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['Name'] = Name;
    _data['Email'] = Email;
    _data['Token'] = Token;
    return _data;
  }
}
