import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theme/theme_helper.dart';
import '../../../../core/utils/global.dart';
import '../page/deatil_screen.dart';


Align buildDotIndicatorAlign() {
  return Align(
    alignment: Alignment.center,
    child: AnimatedSmoothIndicator(
      activeIndex: currentIndex,
      count: (propertyList[0]['imageList'] as List<dynamic>).length,
      effect: JumpingDotEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: ThemeHelper.primaryColors,
        dotColor: Colors.grey.shade400,
      ),
    ),
  );
}
