import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double radius;
  final String url;

  const Avatar.small({super.key, this.radius = 16, required this.url});
  const Avatar.medium({super.key, this.radius = 22, required this.url});
  const Avatar.large({super.key, this.radius = 44, required this.url});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: CachedNetworkImageProvider(url),
      backgroundColor: Colors.grey,
    );
  }
}
