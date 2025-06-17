import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/global.dart';


CarouselSlider buildImageCarouselSlider() {
  return CarouselSlider(
    options: CarouselOptions(
      height: 200.0,
      enlargeCenterPage: true,
      autoPlay: true,
      aspectRatio: 16 / 9,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      viewportFraction: 0.8,
    ),
    items: (propertyList[0]['imageList'] as List<dynamic>).map((
        item,
        ) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
              image: DecorationImage(
                image: AssetImage(item),
                // Ensure image URLs are valid
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      );
    }).toList(),
  );
}