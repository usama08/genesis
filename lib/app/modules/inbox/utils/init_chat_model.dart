class InitChatModel {
  String? message;
  Doc? doc;

  InitChatModel({this.message, this.doc});

  InitChatModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    doc = json['doc'] != null ? new Doc.fromJson(json['doc']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.doc != null) {
      data['doc'] = this.doc!.toJson();
    }
    return data;
  }
}

class Doc {
  String? createdAt;
  bool? request;
  String? sId;
  Sender? sender;
  Sender? receiver;
  List<Messages>? messages;
  int? iV;

  Doc(
      {this.createdAt,
        this.request,
        this.sId,
        this.sender,
        this.receiver,
        this.messages,
        this.iV});

  Doc.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    request = json['request'];
    sId = json['_id'];
    sender =
    json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    receiver =
    json['receiver'] != null ? new Sender.fromJson(json['receiver']) : null;
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(new Messages.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['request'] = this.request;
    data['_id'] = this.sId;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    if (this.receiver != null) {
      data['receiver'] = this.receiver!.toJson();
    }
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Sender {
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

  Sender(
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

  Sender.fromJson(Map<String, dynamic> json) {
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

class Messages {
  String? createdAt;
  String? text;
  bool? isRead;
  int? messageType;
  String? messageSender;
  String? sender;

  Messages(
      {this.createdAt,
        this.text,
        this.isRead,
        this.messageType,
        this.messageSender,
        this.sender});

  Messages.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    text = json['text'];
    isRead = json['isRead'];
    messageType = json['messageType'];
    messageSender = json['messageSender'];
    sender = json['sender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['text'] = this.text;
    data['isRead'] = this.isRead;
    data['messageType'] = this.messageType;
    data['messageSender'] = this.messageSender;
    data['sender'] = this.sender;
    return data;
  }
}