class SearchModel {
  String? message;
  List<Doc>? doc;

  SearchModel({this.message, this.doc});

  SearchModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['doc'] != null) {
      doc = <Doc>[];
      json['doc'].forEach((v) {
        doc!.add(new Doc.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.doc != null) {
      data['doc'] = this.doc!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doc {
  String? createdAt;
  List<String>? defaultImg;
  List<String>? userImages;
  String? profileFor;
  String? phone;
  String? country;
  String? state;
  String? city;
  String? marialStatus;
  String? diet;
  String? employment;
  String? designation;
  String? ownBuisness;
  String? anualIncome;
  bool? isArchive;
  bool? isDeleted;
  bool? isPromoted;
  String? gender;
  int? age;
  String? bio;
  String? publish;
  String? sId;
  String? username;
  String? email;
  String? uid;
  String? provider;
  String? height;
  List<Qualification>? qualification;
  List<Hobbies>? hobbies;
  Geometry? geometry;
  int? iV;

  Doc(
      {this.createdAt,
        this.defaultImg,
        this.userImages,
        this.profileFor,
        this.phone,
        this.country,
        this.state,
        this.city,
        this.marialStatus,
        this.diet,
        this.employment,
        this.designation,
        this.ownBuisness,
        this.anualIncome,
        this.isArchive,
        this.isDeleted,
        this.isPromoted,
        this.gender,
        this.bio,
        this.publish,
        this.sId,
        this.username,
        this.email,
        this.age,
        this.uid,
        this.provider,
        this.height,
        this.qualification,
        this.hobbies,
        this.geometry,
        this.iV});

  Doc.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    defaultImg = json['defaultImg'].cast<String>();
    userImages = json['userImages'].cast<String>();
    profileFor = json['profileFor'];
    phone = json['phone'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    marialStatus = json['marialStatus'];
    diet = json['diet'];
    employment = json['employment'];
    designation = json['designation'];
    ownBuisness = json['ownBuisness'];
    anualIncome = json['anualIncome'];
    isArchive = json['isArchive'];
    isDeleted = json['isDeleted'];
    isPromoted = json['isPromoted'];
    gender = json['gender'];
    bio = json['bio'];
    age = json['age'];
    publish = json['publish'];
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    uid = json['uid'];
    provider = json['provider'];
    height = json['height'];
    if (json['qualification'] != null) {
      qualification = <Qualification>[];
      json['qualification'].forEach((v) {
        qualification!.add(new Qualification.fromJson(v));
      });
    }
    if (json['hobbies'] != null) {
      hobbies = <Hobbies>[];
      json['hobbies'].forEach((v) {
        hobbies!.add(new Hobbies.fromJson(v));
      });
    }
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['defaultImg'] = this.defaultImg;
    data['userImages'] = this.userImages;
    data['profileFor'] = this.profileFor;
    data['phone'] = this.phone;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['marialStatus'] = this.marialStatus;
    data['diet'] = this.diet;
    data['employment'] = this.employment;
    data['designation'] = this.designation;
    data['ownBuisness'] = this.ownBuisness;
    data['anualIncome'] = this.anualIncome;
    data['isArchive'] = this.isArchive;
    data['isDeleted'] = this.isDeleted;
    data['isPromoted'] = this.isPromoted;
    data['gender'] = this.gender;
    data['bio'] = this.bio;
    data['age'] = this.age;
    data['publish'] = this.publish;
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['uid'] = this.uid;
    data['provider'] = this.provider;
    data['height'] = this.height;
    if (this.qualification != null) {
      data['qualification'] =
          this.qualification!.map((v) => v.toJson()).toList();
    }
    if (this.hobbies != null) {
      data['hobbies'] = this.hobbies!.map((v) => v.toJson()).toList();
    }
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Qualification {
  String? createdAt;
  String? qualificationType;
  String? collegeOne;
  String? collegeTwo;
  String? sId;

  Qualification(
      {this.createdAt,
        this.qualificationType,
        this.collegeOne,
        this.collegeTwo,
        this.sId});

  Qualification.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    qualificationType = json['qualificationType'];
    collegeOne = json['collegeOne'];
    collegeTwo = json['collegeTwo'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['qualificationType'] = this.qualificationType;
    data['collegeOne'] = this.collegeOne;
    data['collegeTwo'] = this.collegeTwo;
    data['_id'] = this.sId;
    return data;
  }
}

class Hobbies {
  String? sId;
  String? hobby;
  String? type;

  Hobbies({this.sId, this.hobby, this.type});

  Hobbies.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    hobby = json['hobby'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['hobby'] = this.hobby;
    data['type'] = this.type;
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;
  String? sId;

  Geometry({this.type, this.coordinates, this.sId});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    data['_id'] = this.sId;
    return data;
  }
}
