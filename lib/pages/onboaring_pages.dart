// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboaringPages extends StatelessWidget {
  final String animationUrl;
  final String title;
  final String description;
  const OnboaringPages({
    super.key,
    required this.animationUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //lottie animation
          Lottie.network(animationUrl, height: 300),
          SizedBox(height: 20,),
        //title
        Text(title,
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.grey[800]),
        ),
        //description
        Text(description,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
        )
      ],
    );
  }
}
