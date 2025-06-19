import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme_helper.dart';

Widget buildImageAddPropertyContainer() {
  return DottedBorder(
    options: RoundedRectDottedBorderOptions(
      dashPattern: [10,5],
      strokeWidth: 2,
      radius: Radius.circular(16),
      color: ThemeHelper.secondaryColors,

    ),
    child: Container(
      height: 99,
      width: 220,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.cloud_upload_outlined,
              color: ThemeHelper.primaryColors,
              size: 37,
            ),
          ),
          Text('Select Image'),
        ],
      ),
    ),
  );
}