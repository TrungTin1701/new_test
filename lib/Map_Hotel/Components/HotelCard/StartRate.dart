// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names, must_be_immutable
import 'package:flutter/material.dart';

class StarRate extends StatelessWidget {
  int rate;
  double size;
  StarRate({
    Key? key,
    required this.size,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < rate; i++)
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: size,
          ),
      ],
    );
  }
}
