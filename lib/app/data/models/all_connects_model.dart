class AllConnectsModel {
  String? message;
  Doc? doc;

  AllConnectsModel({this.message, this.doc});

  AllConnectsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    doc = json['doc'] != null
        ? Doc.fromJson(json['doc'])
        : Doc();
  }


}

class Doc {
  List<Filtercommunity>? filtercommunity;
  List<FilteredPref>? filteredPref;
  String? current;
  int? pagesPref;
  int? pagesComm;
  int? total;
  int? preftotal;
  int? commtotal;

  Doc(
      {this.filtercommunity,
        this.filteredPref,
        this.current,
        this.pagesPref,
        this.pagesComm,
        this.total,
        this.preftotal,
        this.commtotal});

  Doc.fromJson(Map<String, dynamic> json) {
    if (json['filtercommunity'] != null) {
      filtercommunity = <Filtercommunity>[];
      json['filtercommunity'].forEach((v) {
        filtercommunity!.add(new Filtercommunity.fromJson(v));
      });
    }
    if (json['filteredPref'] != null) {
      filteredPref = <FilteredPref>[];
      json['filteredPref'].forEach((v) {
        filteredPref!.add(new FilteredPref.fromJson(v));
      });
    }
    current = json['current'];
    pagesPref = json['pagesPref'];
    pagesComm = json['pagesComm'];
    total = json['total'];
    preftotal = json['preftotal'];
    commtotal = json['commtotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filtercommunity != null) {
      data['filtercommunity'] =
          this.filtercommunity!.map((v) => v.toJson()).toList();
    }
    if (this.filteredPref != null) {
      data['filteredPref'] = this.filteredPref!.map((v) => v.toJson()).toList();
    }
    data['current'] = this.current;
    data['pagesPref'] = this.pagesPref;
    data['pagesComm'] = this.pagesComm;
    data['total'] = this.total;
    data['preftotal'] = this.preftotal;
    data['commtotal'] = this.commtotal;
    return data;
  }
}

class Filtercommunity {
  String? createdAt;
  String? religion;
  String? communityType;
  String? motherTounge;
  String? sId;
  Uid? uid;
  int? iV;

  Filtercommunity(
      {this.createdAt,
        this.religion,
        this.communityType,
        this.motherTounge,
        this.sId,
        this.uid,
        this.iV});

  Filtercommunity.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    religion = json['religion'];
    communityType = json['communityType'];
    motherTounge = json['motherTounge'];
    sId = json['_id'];
    uid = json['uid'] != null ? new Uid.fromJson(json['uid']) : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['religion'] = this.religion;
    data['communityType'] = this.communityType;
    data['motherTounge'] = this.motherTounge;
    data['_id'] = this.sId;
    if (this.uid != null) {
      data['uid'] = this.uid!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Uid {
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
  String? bio;
  String? publish;
  String? sId;
  String? uid;
  String? username;
  String? email;
  String? provider;
  String? height;
  List<Qualification>? qualification;
  List<Hobbies>? hobbies;
  int? age;
  Geometry? geometry;

  int? iV;

  Uid(
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
        this.uid,
        this.username,
        this.email,
        this.provider,
        this.height,
        this.qualification,
        this.hobbies,
        this.age,
        this.geometry,
        this.iV});

  Uid.fromJson(Map<String, dynamic> json) {
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
    publish = json['publish'];
    sId = json['_id'];
    uid = json['uid'];
    username = json['username'];
    email = json['email'];
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
    age = json['age'];
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : Geometry();
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
    data['publish'] = this.publish;
    data['_id'] = this.sId;
    data['uid'] = this.uid;
    data['username'] = this.username;
    data['email'] = this.email;
    data['provider'] = this.provider;
    data['height'] = this.height;
    if (this.qualification != null) {
      data['qualification'] =
          this.qualification!.map((v) => v.toJson()).toList();
    }
    if (this.hobbies != null) {
      data['hobbies'] = this.hobbies!.map((v) => v.toJson()).toList();
    }
    data['age'] = this.age;
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

class FilteredPref {
  String? createdAt;
  int? startage;
  int? endAge;
  String? startHeight;
  String? endHeight;
  String? preferedMartialStatus;
  String? preferedReligion;
  String? preferedCommunity;
  String? preferedMotherTongue;
  String? sId;
  Uid? uid;
  int? iV;

  FilteredPref(
      {this.createdAt,
        this.startage,
        this.endAge,
        this.startHeight,
        this.endHeight,
        this.preferedMartialStatus,
        this.preferedReligion,
        this.preferedCommunity,
        this.preferedMotherTongue,
        this.sId,
        this.uid,
        this.iV});

  FilteredPref.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    startage = json['startage'];
    endAge = json['endAge'];
    startHeight = json['startHeight'];
    endHeight = json['endHeight'];
    preferedMartialStatus = json['preferedMartialStatus'];
    preferedReligion = json['preferedReligion'];
    preferedCommunity = json['preferedCommunity'];
    preferedMotherTongue = json['preferedMotherTongue'];
    sId = json['_id'];
    uid = json['uid'] != null ? new Uid.fromJson(json['uid']) : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['startage'] = this.startage;
    data['endAge'] = this.endAge;
    data['startHeight'] = this.startHeight;
    data['endHeight'] = this.endHeight;
    data['preferedMartialStatus'] = this.preferedMartialStatus;
    data['preferedReligion'] = this.preferedReligion;
    data['preferedCommunity'] = this.preferedCommunity;
    data['preferedMotherTongue'] = this.preferedMotherTongue;
    data['_id'] = this.sId;
    if (this.uid != null) {
      data['uid'] = this.uid!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}
