import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/theme/theme_helper.dart';

Column buildImageSection(item) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Card(
          color: ThemeHelper.backgroundColors,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 173,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ThemeHelper.textFieldColors,
                image: DecorationImage(
                  image: AssetImage(item),
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
