// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart';
import 'Users.dart';
import 'dart:async';
import 'dart:convert' show jsonDecode;

class HttpService {
  Future<List<Person>> getPosts({int page = 1}) async {
    // ignore: prefer_const_constructors
    var url = 'https://reqres.in/api/users?page=$page';
    Response res = await get(Uri.parse(url))
        // ignore: prefer_const_constructors
        .timeout(Duration(seconds: 10));
    //List<dynamic> posts = a["data"];
    // ignore: avoid_print

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body)['data'];
      print(body);
      List<Person> posts =
          body.map((dynamic item) => Person.fromJson(item)).toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
