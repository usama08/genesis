import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import '../values/constants.dart';


Future<bool> isApproved()async{

  const url = '${URL}user/status';
  String uid = '${FirebaseAuth.instance.currentUser?.uid}';
  final response  = await http.post(
    Uri.parse(url),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String,String>{
          'uid': uid
      }),
  );

  if(response.statusCode==200){
    ApprovalModel x = ApprovalModel.fromJson(jsonDecode(response.body));
    if(x.doc.first.publish == 'Pending'){
      return true;
    }
  }
  return false;

}


class ApprovalModel {
  ApprovalModel({
    required this.message,
    required this.doc,
  });

  String message;
  List<Doc> doc;

  factory ApprovalModel.fromJson(Map<String, dynamic> json) => ApprovalModel(
    message: json["message"],
    doc: List<Doc>.from(json["doc"].map((x) => Doc.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "doc": List<dynamic>.from(doc.map((x) => x.toJson())),
  };
}

class Doc {
  Doc({
    required this.publish,
    required this.id,
  });

  String publish;
  String id;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    publish: json["publish"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "publish": publish,
    "_id": id,
  };
}
