import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  final int rating;

  const RatingStar({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(
      stars,
      style: TextStyle(fontSize: 14.0),
    );
  }
}
