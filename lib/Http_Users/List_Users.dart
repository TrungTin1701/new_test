// ignore: file_names
// ignore_for_file: import_of_legacy_library_into_null_safe, file_names, prefer_const_constructors, duplicate_ignore, prefer_final_fields, non_constant_identifier_names, avoid_print

import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/material.dart';
import 'package:new_test/HomePage/homepage.dart';
import 'Users.dart';
import 'http_service.dart';
import 'package:new_test/Http_Users/ProfileUsers/profileusers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Postpage extends StatefulWidget {
  const Postpage({Key? key}) : super(key: key);

  @override
  State<Postpage> createState() => _PostpageState();
}

class _PostpageState extends State<Postpage> {
  HttpService httpService = HttpService();
  int page = 1;
  RefreshController _refreshController = RefreshController();
  List<Person> Posts = [];
  GlobalKey _contenKey = GlobalKey();
  GlobalKey _refreshIndicatorKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    httpService.getPosts().then((value) => {
          setState(() {
            Posts = value;
          })
        });
  }

  void _onFresh() async {
    print("On Fresh");
    await Future.delayed(Duration(seconds: 2));
    var list = await httpService.getPosts(page: 1);
    Posts.clear();
    Posts.addAll(list);
    setState(() {
      _refreshController.refreshCompleted();
    });
  }

  void _onLoading() async {
    print("On Loading");
    page++;
    var list = await httpService.getPosts(page: page);
    Posts.addAll(list);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _refreshController.refreshCompleted();
    });
  }

  Widget buildCTN() {
    return ListView.separated(
      key: _contenKey,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetail(
                  post: Posts[index],
                ),
              ),
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
                    imageBuilder: (context, imageProvider) => Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 0.0, color: Colors.transparent),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: imageProvider,
                          ),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(2, 2),
                                blurRadius: 3,
                                color: Colors.black.withOpacity(0.1))
                          ]),
                    ),
                    fit: BoxFit.cover,
                    imageUrl: Posts[index].avatar,
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
                        padding: const EdgeInsets.only(top: 0, bottom: 0),
                        child: Text(
                          Posts[index].firstName + " " + Posts[index].lastName,
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
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: Posts[index].email,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
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
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.black,
        );
      },
      itemCount: Posts.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Users",
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: SmartRefresher(
        controller: _refreshController,
        key: _refreshIndicatorKey,
        enablePullDown: true,
        enablePullUp: true,
        child: buildCTN(),
        physics: BouncingScrollPhysics(),
        footer: ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
        ),
        onLoading: _onFresh,
        onRefresh: _onLoading,
        header: WaterDropMaterialHeader(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Show refresh indicator programmatically on button tap.
          _refreshController.requestRefresh();
        },
        icon: const Icon(Icons.refresh),
        label: const Text('Show Indicator'),
      ),
    );
  }
}
