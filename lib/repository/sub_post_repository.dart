import 'dart:convert';
import 'package:bloc_demo/model/data_model.dart';
import 'package:http/http.dart' as http;

class SubPostRepository {
  Future<DataModel> subPostUsers({int? id}) async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return DataModel.fromJson(data);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
