import 'dart:convert';
import '../../../modules/inbox/utils/init_chat_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../../core/values/constants.dart';

class InitChat {
  Future<Doc?> initializeChat(String receiverId) async {
    String senderId = GetStorage().read('UserId');
    final response = await http.post(
      Uri.parse('${URL}chat/getChat'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "sender": senderId,
        "receiver": receiverId
        // "sender" : "64321afc65dfc4742cbcc990",
        // "receiver" : "64321b0465dfc4742cbcc995"
      }),
    );

    if (response.statusCode == 200) {
      return InitChatModel.fromJson(jsonDecode(response.body)).doc;
    } else {
      return null;
    }
  }
}
