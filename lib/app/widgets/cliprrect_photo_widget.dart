import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';

class ClipRRectPhotoWidget extends StatelessWidget {
  final String photo;
  final Color? color;

  const ClipRRectPhotoWidget({
    Key? key,
    required this.photo,
    this.color = Colors.black12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: CachedNetworkImage(
        imageUrl: photo,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
        ),
        placeholder: (context, url) => const Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              valueColor: AlwaysStoppedAnimation<Color>(
                Constants.whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
