import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../consts.dart';
class ImageLaoder extends StatelessWidget {
  String url;
  ImageLaoder({required this.url});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fitHeight,
      imageUrl: ApiLinks.host+url,
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
