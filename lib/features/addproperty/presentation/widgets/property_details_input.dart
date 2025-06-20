import 'package:default_project/core/utils/app_validation.dart';
import 'package:default_project/features/addproperty/presentation/widgets/property_image_upload.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/custome_size_box.dart';
import 'common_textfield.dart';


Row buildShortTextField(TextEditingController txtRating,TextEditingController txtDiscount) {
  return Row(
    children: [
      buildHeightSizedBox(10),
      Expanded(child: buildAddPropertyDefaultText(text: 'Discount')),
      Expanded(
        child: buildAddPropertyDefaultTextField(
          isEnabled: false,
          label: '20% discount',
          controller: txtDiscount,
          keyboardType: TextInputType.number,
          validator: AppValidations.validateRequired
        ),
      ),
      buildHeightSizedBox(10),
      Expanded(child: buildAddPropertyDefaultText(text: 'Rating')),
      Expanded(
        child: buildAddPropertyDefaultTextField(
          isEnabled: false,
          label: '3.6 Rating',
          controller: txtRating,
          keyboardType: TextInputType.number,
            validator: AppValidations.validateRequired
        ),
      ),
    ],
  );
}
