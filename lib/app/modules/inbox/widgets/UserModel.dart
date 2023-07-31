class UserModel {
  String? uid;
  String? fullname;
  String? email;
  String? profilepic;

  UserModel({this.uid, this.fullname, this.email, this.profilepic});

  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    fullname = map["name"];
    email = map["email"];
    profilepic = map["imgUrl"];
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": fullname,
      "email": email,
      "imgUrl": profilepic,
    };
  }
}