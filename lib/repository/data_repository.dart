import 'dart:convert';
import 'package:bloc_demo/model/data_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<DataModel>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((user) => DataModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
