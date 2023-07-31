class SignupModel {
  SignupModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.defaultImg,
    required this.provider,
    required this.profileFor,
    required this.phone,
    required this.country,
    required this.state,
    required this.city,
    required this.martialStatus,
    required this.diet,
    required this.height,
    required this.qualification,
    required this.employment,
    required this.designation,
    required this.ownBuisness,
    required this.anualIncome,
    required this.hobbies,
    required this.gender,
    required this.bio,
    required this.age,
    required this.longitude,
    required this.latitude,
  });

  String uid;
  String username;
  String email;
  String defaultImg;
  String provider;
  String profileFor;
  String phone;
  String country;
  String state;
  String city;
  String martialStatus;
  String diet;
  String height;
  List<Qualification> qualification;
  String employment;
  String designation;
  String ownBuisness;
  String anualIncome;
  List<Hobby> hobbies;
  String gender;
  String bio;
  int age;
  String longitude;
  String latitude;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
    uid: json["uid"],
    username: json["username"],
    email: json["email"],
    defaultImg: json["defaultImg"],
    provider: json["provider"],
    profileFor: json["profileFor"],
    phone: json["phone"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    martialStatus: json["marialStatus"],
    diet: json["diet"],
    height: json["height"],
    qualification: List<Qualification>.from(json["qualification"].map((x) => Qualification.fromJson(x))),
    employment: json["employment"],
    designation: json["designation"],
    ownBuisness: json["ownBuisness"],
    anualIncome: json["anualIncome"],
    hobbies: List<Hobby>.from(json["hobbies"].map((x) => Hobby.fromJson(x))),
    gender: json["gender"],
    bio: json["bio"],
    age: json["age"],
    longitude: json["longitude"],
    latitude: json["latitude"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "username": username,
    "email": email,
    "defaultImg": defaultImg,
    "provider": provider,
    "profileFor": profileFor,
    "phone": phone,
    "country": country,
    "state": state,
    "city": city,
    "marialStatus": martialStatus,
    "diet": diet,
    "height": height,
    "qualification": List<dynamic>.from(qualification.map((x) => x.toJson())),
    "employment": employment,
    "designation": designation,
    "ownBuisness": ownBuisness,
    "anualIncome": anualIncome,
    "hobbies": List<dynamic>.from(hobbies.map((x) => x.toJson())),
    "gender": gender,
    "bio": bio,
    "age": age,
    "longitude": longitude,
    "latitude": latitude,
  };
}

class Hobby {
  Hobby({
    required this.hobby,
    required this.type,
  });

  String hobby;
  String type;

  factory Hobby.fromJson(Map<String, dynamic> json) => Hobby(
    hobby: json["hobby"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "hobby": hobby,
    "type": type,
  };
}

class Qualification {
  Qualification({
    required this.qualificationType,
    required this.collegeOne,
    required this.collegeTwo,
  });

  String qualificationType;
  String collegeOne;
  String collegeTwo;

  factory Qualification.fromJson(Map<String, dynamic> json) => Qualification(
    qualificationType: json["qualificationType"],
    collegeOne: json["collegeOne"],
    collegeTwo: json["collegeTwo"],
  );

  Map<String, dynamic> toJson() => {
    "qualificationType": qualificationType,
    "collegeOne": collegeOne,
    "collegeTwo": collegeTwo,
  };
}
