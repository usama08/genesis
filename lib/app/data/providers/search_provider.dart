import 'dart:convert';
import 'package:genesis/app/data/models/search_model.dart';
import 'package:http/http.dart' as http;
import '../../../core/values/constants.dart';

class SearchProvider {
  Future<List<Doc>?> getSearchedMembers(String search) async {
    const url = '${URL}user/searchUser';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'username': search}),
    );
    //print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return SearchModel.fromJson(jsonDecode(response.body)).doc;
    }
    return null;
  }
}
