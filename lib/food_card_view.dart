import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodCardWidget extends StatelessWidget {
  final String image;
  final String name;

  const FoodCardWidget({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Container()),
                Icon(
                  CupertinoIcons.heart,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            ImageWidget(
              radius: 60.0,
              image: image,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name.toUpperCase(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final double radius;
  final String image;

  const ImageWidget({super.key, required this.radius, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 2,
            color: Colors.black.withOpacity(0.3))
      ]),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(image),
      ),
    );
  }
}
