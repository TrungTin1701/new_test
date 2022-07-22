// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        image: DecorationImage(
            image: NetworkImage(
                'https://assets.simpleviewcms.com/simpleview/image/fetch/c_limit,h_1200,q_75,w_1200/https://media.newmindmedia.com/TellUs/image/%3Ffile%3DHotel_Continental_Fasade_1.1_2044991424.jpg%26dh%3D600%26dw%3D800%26cropX%3D0%26cropY%3D0%26cropH%3D621%26cropW%3D828%26t%3D4'),
            fit: BoxFit.cover),
      ),
    );
  }
}
