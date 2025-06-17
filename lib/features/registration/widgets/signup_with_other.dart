import 'package:flutter/material.dart';

import '../../../core/theme/theme_helper.dart';

Row buildDefaultSignUpWithOther() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 10,
    children: [
      Expanded(
        child: Divider(
          color: ThemeHelper.secondaryColors,
          height: 0.80,
          indent: 70,
          endIndent: 0,
        ),
      ),
      Image(image: AssetImage('assets/png/search.png'), height: 20, width: 20),
      Image(
        image: AssetImage('assets/png/facebook.png'),
        height: 20,
        width: 20,
      ),
      Image(image: AssetImage('assets/png/twitter.png'), height: 20, width: 20),
      Expanded(
        child: Divider(
          height: 0.80,
          indent: 0,
          endIndent: 70,
          color: ThemeHelper.secondaryColors,
        ),
      ),
    ],
  );
}