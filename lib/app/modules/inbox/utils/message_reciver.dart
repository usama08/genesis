class MessageReceiver {
  String? message;
  Data? data;

  MessageReceiver({this.message, this.data});

  MessageReceiver.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? createdAt;
  bool? request;
  String? sId;
  Sender? sender;
  Receiver? receiver;
  String? lastMessage;
  List<Messages>? messages;

  Data(
      {this.createdAt,
        this.request,
        this.sId,
        this.sender,
        this.receiver,
        this.lastMessage,
        this.messages});

  Data.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    request = json['request'];
    sId = json['_id'];
    sender =
    json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    receiver = json['receiver'] != null
        ? new Receiver.fromJson(json['receiver'])
        : null;
    lastMessage = json['lastMessage'];
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(new Messages.fromJson(v));
      });
    }
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
    data['lastMessage'] = this.lastMessage;
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sender {
  String? createdAt;
  List<String>? defaultImg;
  List<String>? userImages;
  String? marialStatus;
  String? diet;
  String? employment;
  String? designation;
  String? ownBuisness;
  String? anualIncome;
  String? sid;

  Sender(
      {this.createdAt,
        this.defaultImg,
        this.userImages,
        this.marialStatus,
        this.diet,
        this.employment,
        this.designation,
        this.ownBuisness,
        this.sid,
        this.anualIncome});

  Sender.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    defaultImg = json['defaultImg'].cast<String>();
    userImages = json['userImages'].cast<String>();
    marialStatus = json['marialStatus'];
    diet = json['diet'];
    employment = json['employment'];
    designation = json['designation'];
    ownBuisness = json['ownBuisness'];
    anualIncome = json['anualIncome'];
    sid = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['defaultImg'] = this.defaultImg;
    data['userImages'] = this.userImages;
    data['marialStatus'] = this.marialStatus;
    data['diet'] = this.diet;
    data['employment'] = this.employment;
    data['designation'] = this.designation;
    data['ownBuisness'] = this.ownBuisness;
    data['anualIncome'] = this.anualIncome;
    data['_id']= this.sid;
    return data;
  }
}

class Receiver {
  String? createdAt;
  List<String>? defaultImg;
  List<String>? userImages;
  String? username;
  String? sid;

  Receiver({this.createdAt, this.defaultImg, this.userImages, this.username,this.sid});

  Receiver.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    defaultImg = json['defaultImg'].cast<String>();
    userImages = json['userImages'].cast<String>();
    username = json['username'];
    sid = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['defaultImg'] = this.defaultImg;
    data['userImages'] = this.userImages;
    data['username'] = this.username;
    data['_id'] = this.sid;
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
