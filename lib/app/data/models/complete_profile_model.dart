class CompleteProfileModel {
  CompleteProfileModel({
    required this.username,
    required this.email,
    required this.defaultImg,
    required this.provider,
    required this.profileFor,
    required this.phone,
    required this.country,
    required this.state,
    required this.city,
    required this.marialStatus,
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
    required this.community,
    required this.preference,
  });

  String username;
  String email;
  String defaultImg;
  String provider;
  String profileFor;
  String phone;
  String country;
  String state;
  String city;
  String marialStatus;
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
  List<Community> community;
  List<Preference> preference;

  factory CompleteProfileModel.fromJson(Map<String, dynamic> json) => CompleteProfileModel(
    username: json["username"],
    email: json["email"],
    defaultImg: json["defaultImg"],
    provider: json["provider"],
    profileFor: json["profileFor"],
    phone: json["phone"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    marialStatus: json["marialStatus"],
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
    community: List<Community>.from(json["community"].map((x) => Community.fromJson(x))),
    preference: List<Preference>.from(json["preference"].map((x) => Preference.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "defaultImg": defaultImg,
    "provider": provider,
    "profileFor": profileFor,
    "phone": phone,
    "country": country,
    "state": state,
    "city": city,
    "marialStatus": marialStatus,
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
    "community": List<dynamic>.from(community.map((x) => x.toJson())),
    "preference": List<dynamic>.from(preference.map((x) => x.toJson())),
  };
}

class Community {
  Community({
    required this.religion,
    required this.communityType,
    required this.motherTounge,
  });

  String religion;
  String communityType;
  String motherTounge;

  factory Community.fromJson(Map<String, dynamic> json) => Community(
    religion: json["religion"],
    communityType: json["communityType"],
    motherTounge: json["motherTounge"],
  );

  Map<String, dynamic> toJson() => {
    "religion": religion,
    "communityType": communityType,
    "motherTounge": motherTounge,
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

class Preference {
  Preference({
    required this.startage,
    required this.endAge,
    required this.startHeight,
    required this.endHeigh,
    required this.preferedMartialStatus,
    required this.preferedReligion,
    required this.preferedCommunity,
    required this.preferedMotherTongue,
  });

  int startage;
  int endAge;
  String startHeight;
  String endHeigh;
  String preferedMartialStatus;
  String preferedReligion;
  String preferedCommunity;
  String preferedMotherTongue;

  factory Preference.fromJson(Map<String, dynamic> json) => Preference(
    startage: json["startage"],
    endAge: json["endAge"],
    startHeight: json["startHeight"],
    endHeigh: json["endHeigh"],
    preferedMartialStatus: json["preferedMartialStatus"],
    preferedReligion: json["preferedReligion"],
    preferedCommunity: json["preferedCommunity"],
    preferedMotherTongue: json["preferedMotherTongue"],
  );

  Map<String, dynamic> toJson() => {
    "startage": startage,
    "endAge": endAge,
    "startHeight": startHeight,
    "endHeigh": endHeigh,
    "preferedMartialStatus": preferedMartialStatus,
    "preferedReligion": preferedReligion,
    "preferedCommunity": preferedCommunity,
    "preferedMotherTongue": preferedMotherTongue,
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
