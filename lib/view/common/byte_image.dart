import 'dart:typed_data';

import 'package:flutter/material.dart';

class ByteImage extends StatelessWidget {
  const ByteImage({super.key, required this.bytes});
  final Uint8List? bytes;
  @override
  Widget build(BuildContext context) {
    return bytes == null
        ? const Icon(
            Icons.image,
            size: 60.0,
          )
        : ClipOval(
            child: SizedBox(
              width: 60.0,
              height: 60.0,
              child: Image.memory(bytes!, fit: BoxFit.cover),
            ),
          );
  }
}
