import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({super.key, required this.imgurl, this.imgheight, this.imgwidth, this.imgboxfit});

  final String imgurl;
  final double? imgheight;
  final double? imgwidth;
  final BoxFit? imgboxfit;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CachedNetworkImage(
        height: imgheight ?? size.width*0.4,
        width: imgwidth ?? size.width*0.4,
        imageUrl: imgurl,
      fit: imgboxfit?? BoxFit.cover,
    );
  }
}
