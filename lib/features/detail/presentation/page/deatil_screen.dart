import 'package:carousel_slider/carousel_slider.dart';
import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/core/utils/custome_size_box.dart';
import 'package:default_project/core/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/common_widgets_details.dart';
import '../widgets/detail_section.dart';
import '../widgets/image_section.dart';

import '../widgets/smooth_indicator_section.dart';

int currentIndex = 0;

class DetailScreen extends StatefulWidget {
  static Widget builder(BuildContext context) {
    return const DetailScreen();
  }

  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColors,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildHeightSizedBox(20),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,

                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 1,
                initialPage: currentFilterIndex,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              items: (propertyList[0]['imageList'] as List<dynamic>).map((
                item,
              ) {
                return Builder(
                  builder: (BuildContext context) {
                    return buildImageSection(item);
                  },
                );
              }).toList(),
            ),
            buildDotIndicatorAlign(),
            buildHeightSizedBox(10),

            Wrap(
              children: [
                buildTextMethod('Limited Time ', ThemeHelper.secondaryColors),
                Text(
                  '${propertyList[0]['building_name']}',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: ThemeHelper.primaryColors,
                    ),
                  ),
                ),
                buildTextMethod('is coming back!', ThemeHelper.secondaryColors),
              ],
            ),
            buildHeightSizedBox(5),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: buildTextCommon('Description'),
            ),
            buildDetailsSectionExpanded(),
            buildHeightSizedBox(40),
          ],
        ),
      ),
    );
  }
}
