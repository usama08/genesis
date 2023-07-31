import 'dart:convert';
import 'package:genesis/app/modules/inbox/utils/recent_chats_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../../core/values/constants.dart';

class GetAllChatsProvider {
  Future<List<Doc>?> getAllChats() async {
    String userId = GetStorage().read('UserId');
    final response = await http.post(
      Uri.parse('${URL}chat/getAllMyChats'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"user": userId}),
    );

    if (response.statusCode == 200) {
      return RecentChatModel.fromJson(jsonDecode(response.body)).doc;
    }
    return null;
  }
}
