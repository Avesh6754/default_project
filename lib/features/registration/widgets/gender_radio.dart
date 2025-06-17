import 'package:flutter/material.dart';

import '../../../core/theme/theme_helper.dart';

Row buildGenderRadio() {
  return Row(
    children: [
      Expanded(
        child: RadioListTile(
          materialTapTargetSize: MaterialTapTargetSize.values.first,
          activeColor: ThemeHelper.primaryColors,
          title: Text('Male'),
          value: 'Male',
          groupValue: 'Female',
          onChanged: (value) {},
        ),
      ),
      Expanded(
        child: RadioListTile(
          materialTapTargetSize: MaterialTapTargetSize.values.first,
          activeColor: ThemeHelper.primaryColors,
          title: Text('Female'),
          value: 'Female',
          groupValue: 'Female',
          onChanged: (value) {},
        ),
      ),
    ],
  );
}