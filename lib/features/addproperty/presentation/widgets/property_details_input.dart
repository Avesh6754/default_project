import 'package:default_project/features/addproperty/presentation/widgets/property_image_upload.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/custome_size_box.dart';
import 'common_textfield.dart';

Column buildAddPropertyTextField() {
  return Column(
    spacing: 5,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildHeightSizedBox(15),
      buildAddPropertyDefaultText(text: 'Building Name'),
      buildAddPropertyDefaultTextField(
        isEnabled: false,
        label: 'Building Name',
        controller: TextEditingController(),
        keyboardType: TextInputType.text,
        isAddress: false,
      ),
      buildHeightSizedBox(10),
      buildAddPropertyDefaultText(text: 'Apartment Type'),
      buildAddPropertyDefaultTextField(
        isEnabled: false,
        label: 'Row House/Apartment',
        controller: TextEditingController(),
        keyboardType: TextInputType.text,
        isAddress: false,
      ),
      buildHeightSizedBox(10),
      buildAddPropertyDefaultText(text: 'Location'),
      buildAddPropertyDefaultTextField(
        isEnabled: false,
        isAddress: true,
        label: 'flat no 32 / 2nd floor',
        controller: TextEditingController(),
        keyboardType: TextInputType.text,
      ),
      buildHeightSizedBox(10),
      buildAddPropertyDefaultText(text: 'Price'),
      buildAddPropertyDefaultTextField(
        isEnabled: false,
        label: '\$ 1000-2000',
        controller: TextEditingController(),
        keyboardType: TextInputType.number,
      ),
      buildHeightSizedBox(10),
      buildAddPropertyDefaultText(text: 'Image Upload'),
      Align(
        alignment: Alignment.center,
        child: buildImageAddPropertyContainer(),
      ),
      buildHeightSizedBox(10),
      buildShortTextField(),
      buildHeightSizedBox(10),
      Row(
        children: [
          buildHeightSizedBox(10),
          Expanded(child: buildAddPropertyDefaultText(text: 'Plot')),
          Expanded(
            child: buildAddPropertyDefaultTextField(
              isEnabled: false,
              label: '5',
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
            ),
          ),
          buildHeightSizedBox(10),
          Expanded(child: buildAddPropertyDefaultText(text: 'Kitchen')),
          Expanded(
            child: buildAddPropertyDefaultTextField(
              isEnabled: false,
              label: '2',
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
      buildHeightSizedBox(10),
      Row(
        children: [
          buildHeightSizedBox(10),
          Expanded(child: buildAddPropertyDefaultText(text: 'Room')),
          Expanded(
            child: buildAddPropertyDefaultTextField(
              isEnabled: false,
              label: '3',
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
            ),
          ),
          buildHeightSizedBox(10),
          Expanded(child: buildAddPropertyDefaultText(text: 'Hall')),
          Expanded(
            child: buildAddPropertyDefaultTextField(
              isEnabled: false,
              label: 'eg. 1',
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
      buildHeightSizedBox(10),
      buildAddPropertyDefaultText(text: 'Washroom'),
      buildAddPropertyDefaultTextField(
        isEnabled: false,
        label: 'eg. 2',
        controller: TextEditingController(),
        keyboardType: TextInputType.number,
      ),
      buildHeightSizedBox(10),
      buildAddPropertyDefaultText(text: 'Description'),
      buildAddPropertyDefaultTextField(
        isAddress: true,
        isEnabled: false,
        label:
            'Lorenum ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        controller: TextEditingController(),
        keyboardType: TextInputType.text,
      ),
      buildHeightSizedBox(20),
    ],
  );
}

Row buildShortTextField() {
  return Row(
    children: [
      buildHeightSizedBox(10),
      Expanded(child: buildAddPropertyDefaultText(text: 'Discount')),
      Expanded(
        child: buildAddPropertyDefaultTextField(
          isEnabled: false,
          label: '20% discount',
          controller: TextEditingController(),
          keyboardType: TextInputType.number,
        ),
      ),
      buildHeightSizedBox(10),
      Expanded(child: buildAddPropertyDefaultText(text: 'Rating')),
      Expanded(
        child: buildAddPropertyDefaultTextField(
          isEnabled: false,
          label: '3.6 Rating',
          controller: TextEditingController(),
          keyboardType: TextInputType.number,
        ),
      ),
    ],
  );
}
