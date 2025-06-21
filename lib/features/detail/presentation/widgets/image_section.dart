import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/theme/theme_helper.dart';
import '../../../registration/widgets/image_view.dart';

Column buildImageSection(item) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          shadowColor: ThemeHelper.textFieldColors,
          child: CustomImageView(
            imagePath: item,
            height: 25,
            width: double.infinity,
            radius: BorderRadius.circular(10),
          ),
        ),
      ),
    ],
  );
}

Widget buildAddPageImageSection(item) {
  return Card(
    color: ThemeHelper.backgroundColors,

    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Image.file(
          File(item),
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text('Image load failed')),
        ),
      ),
    ),
  );
}
