import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchUsers() async {
  var result =
      await http.get(Uri.parse("https://randomuser.me/api/?results=20"));
  return jsonDecode(result.body)['results'];
}
