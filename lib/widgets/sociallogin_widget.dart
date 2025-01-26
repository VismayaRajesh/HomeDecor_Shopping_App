import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SocialLoginWidget extends StatelessWidget {
  final String imageUrl; // Accepts a URL for the image

  const SocialLoginWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2), // Adds slight vertical shadow
          ),
        ],
      ),
      child: Center(
        child: CachedNetworkImage(
          imageUrl: imageUrl, // Image URL for CachedNetworkImage
          placeholder: (context, url) => CircularProgressIndicator(), // Placeholder while loading
          errorWidget: (context, url, error) => Icon(Icons.error), // Fallback for errors
          width: 30, // Adjust image size within the container
          height: 30,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
