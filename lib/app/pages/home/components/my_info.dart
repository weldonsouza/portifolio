import 'package:flutter/material.dart';

import '../../../../domain/models/profile_model.dart';
import '../../../widgets/cliprrect_photo_widget.dart';

class MyInfo extends StatelessWidget {
  final ProfileModel profile;

  const MyInfo({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: const Color(0xFF242430),
        child: Column(
          children: [
            const Spacer(flex: 2),
            ClipRRectPhotoWidget(
              photo: profile.photo ?? '',
            ),
            const Spacer(),
            Text(
              profile.name!,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                profile.description!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  height: 1.5,
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
