import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:usermanagementapp/models/create_user_model.dart';
import 'package:usermanagementapp/models/serializers.dart';

class UserRepository {
  static String mainUrl = "https://reqres.in";

  Future<String?> createUser(String name, String job) async {
    var createUserUrl = '$mainUrl/api/users';
    final createUser = CreateUserModel(
      (b) =>
          b
            ..name = name
            ..job = job,
    );

    final response = await http.post(
      Uri.parse(createUserUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        serializers.serializeWith(CreateUserModel.serializer, createUser),
      ),
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String id = responseData['id'];
      return id;
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }

  //Directly passes a simple Map<String, dynamic> to jsonEncode() without any model. Since API doesnot work.
  Future<bool> updateUser(
    int id,
    String firstName,
    String lastName,
    String email,
  ) async {
    var updateUserUrl = '$mainUrl/api/users/$id';
    final response = await http.put(
      Uri.parse(updateUserUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        //Plain JSON map: (Can be Serialized using built_value later)
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
      }),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    } else {
      throw Exception('Cannot Update user');
    }
  }

  Future<bool> deleteUser(int id) async {
    var deleteUserUrl = '$mainUrl/api/users/$id';
    final response = await http.delete(Uri.parse(deleteUserUrl));
    if (response.statusCode == 204) {
      return true;
    } else {
      throw Exception('Error: Something went wrong...');
    }
  }
}
