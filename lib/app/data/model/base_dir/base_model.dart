class BaseModel<T> {
  // int code;
  // String message;
  // dynamic data;
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String gender;
  String image;
  String token;

  BaseModel({
    // required this.code,
    // required this.message,
    // this.data,
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.token,
  });

  factory BaseModel.fromJson(
          Map<String, dynamic> json, Function(Map<String, dynamic>) create) =>
      BaseModel(
          id: json["id"],
          username: json["username"],
          email: json["email"],
          firstName: json["firstName"],
          lastName: json["lastName"],
          gender: json["gender"],
          image: json["image"],
          token: json["token"]
          // code: json["code"],
          // message: json["message"],
          // data: (json["data"] != null)
          //     ? (json["data"] is List)
          //         ? List<T>.from(json["data"].map((x) => create(x)))
          //         : create(json["data"])
          // : null,
          );
}
