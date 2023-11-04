
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
Widget buildLeadingWidget(String imageUrl) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    placeholder: (context, url) => CircularProgressIndicator(),
    errorWidget: (context, url, error) => Icon(
      Icons.error,
      color: Colors.red,
      size: 50.0,
    ),
  );
}