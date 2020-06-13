import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;

  ProfileImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.fill
        ),
      ),
    );
  }
}
