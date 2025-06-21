import 'package:default_project/features/detail/bloc/details_bloc.dart';
import 'package:default_project/features/detail/model/details_modal.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theme/theme_helper.dart';


Align buildDotIndicatorAlign(DetailsState state,DetailsSelectedModel detailsBloc ) {
  return Align(
    alignment: Alignment.center,
    child: AnimatedSmoothIndicator(
      activeIndex: state.currentIndex,
      count: (detailsBloc.images.isNotEmpty)?detailsBloc.images.length:1,
      effect: JumpingDotEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: ThemeHelper.primaryColors,
        dotColor: Colors.grey.shade400,
      ),
    ),
  );
}
