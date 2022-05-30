// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart';
import 'Users.dart';
import 'dart:async';
import 'dart:convert' show jsonDecode;

class HttpService {
  final String postsURL = "https://reqres.in/api/users?page=2";

  Future<List<Person>> getPosts() async {
    Response res = await get(postsURL).timeout(Duration(seconds: 10));
    //List<dynamic> posts = a["data"];
    if (res.statusCode == 200) {
      print("Hehe");
      List<dynamic> body = jsonDecode(res.body)['data'];

      List<Person> posts =
          body.map((dynamic item) => Person.fromJson(item)).toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
