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