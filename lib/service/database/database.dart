import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:profile_update_app/service/model/user_details.dart';

class DataBase {
  DataBase._internal();
  static DataBase instance = DataBase._internal();

  Future<List<UserDetails>> getUserDetailsList() async {
    //
    List<UserDetails> repoList = [];

    var response = await http.get(Uri.parse(
      'http://maccode.in/adhoccars/mypanel/api_adhocCars/user_profile_update_list.php?user_id=1',
    ));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      List responseList = jsonResponse['data'];

      for (var response in responseList) {
        repoList.add(UserDetails.fromJson(response));
      }

      //  repoList.sort(((a, b) => b.stargazersCount.compareTo(a.stargazersCount)));
      return repoList;
    } else {
      Exception('No document found');
    }
    return repoList;
  }

  Future<String> postProfileUpdate(UserDetails user) async {
    //
    String status = '';

    var response = await http.post(
        Uri.parse(
          'http://maccode.in/adhoccars/mypanel/api_adhocCars/user_profile_update.php',
        ),
        body: user.toJson());
    print(response.body.length);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      status = jsonResponse;
      print(status);
      return status;
    } else {
      Exception('No document found');
    }
    return status;
  }
}
