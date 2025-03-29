import 'dart:convert';

import 'package:usermanagementapp/models/model.dart';
import 'package:http/http.dart' as http;
import 'package:usermanagementapp/models/serializers.dart';

class ViewUsersListsRepository {
  static String mainUrl = "https://reqres.in";
  var viewUsersLists = '$mainUrl/api/users';

  Future<ViewUsersListsModel?> getUsersLists(int pageNumber) async {
    final response = await http.get(
      Uri.parse('$viewUsersLists?page=$pageNumber'),
    );
    if (response.statusCode == 200) {
      ViewUsersListsModel? viewUsersLists = serializers.deserializeWith(
        ViewUsersListsModel.serializer,
        json.decode(response.body),
      );

      return viewUsersLists;
    } else {
      throw Exception("Something went wrong");
    }
  }
}
