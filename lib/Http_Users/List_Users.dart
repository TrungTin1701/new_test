import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_test/HomePage/homepage.dart';
import 'package:new_test/Profile/profile.dart';
import 'Users.dart';
import 'http_service.dart';
import 'package:new_test/Http_Users/ProfileUsers/profileusers.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Users"),
        backgroundColor: kPrimaryColor,
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
          if (snapshot.hasData) {
            List<Person>? posts = snapshot.data;
            return ListView(
              children: posts!
                  .map(
                    (Person post) => GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PostDetail(
                                    post: post,
                                  )),
                        ),
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CachedNetworkImage(
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 0.0,
                                          color: Colors.transparent),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: imageProvider,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(2, 2),
                                            blurRadius: 3,
                                            color:
                                                Colors.black.withOpacity(0.1))
                                      ]),
                                ),
                                fit: BoxFit.cover,
                                imageUrl: post.avatar,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) => Icon(
                                  Icons.error,
                                  size: 100,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 0),
                                    child: Text(
                                      post.firstName + " " + post.lastName,
                                      style: const TextStyle(
                                          fontFamily: 'Roboto1',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Email: ",
                                                  style: const TextStyle(
                                                      fontFamily: 'Roboto1',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                TextSpan(
                                                  text: post.email,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]),
                                  const SizedBox(
                                    height: 10.5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
