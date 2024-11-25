
import 'package:flutter/material.dart';

class UploadImageAvatarWidget extends StatelessWidget {
  const UploadImageAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 36, // Adjust the radius as needed
            backgroundColor: Colors.grey.shade300,
            child: Icon(
              Icons.image_outlined,
              size: 40,
              color: Colors.grey.shade600,
            ),
          ),
          // Positioned camera icon
          const CircleAvatar(
            radius: 12,
            backgroundColor: Colors.yellow,
            child: Icon(
              Icons.camera_alt_outlined,
              size: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}