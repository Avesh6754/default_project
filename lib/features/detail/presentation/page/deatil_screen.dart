import 'package:carousel_slider/carousel_slider.dart';
import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/core/utils/custome_size_box.dart';
import 'package:default_project/core/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/common_widgets_details.dart';
import '../widgets/image_slider.dart';

class DetailScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return const DetailScreen();
  }

  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColors,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeightSizedBox(20),
            buildImageCarouselSlider(),
            Wrap(
              children: [
                buildTextMethod('Limited Time ', ThemeHelper.secondaryColors),
                buildTextMethod(
                  '${propertyList[0]['building_name']} ',
                  ThemeHelper.primaryColors,
                ),
                buildTextMethod('is coming back!', ThemeHelper.secondaryColors),
              ],
            ),
            buildTextCommon('Description'),
            Expanded(
              child: Card(
                color: ThemeHelper.backgroundColors,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTextCard(
                          '${propertyList[currentFilterIndex]['description']}',
                          false,
                        ),
                        const SizedBox(height: 5),
                        buildDescriptionCard('Location : ',
                            '${propertyList[currentFilterIndex]['address']}'),
                        buildDescriptionCard('Price : ',    '\$ ${propertyList[currentFilterIndex]['price']}'),
                        buildDescriptionCard('Discount : ',    ' ${propertyList[currentFilterIndex]['discount']}'),
                        buildDescriptionCard('Rating : ',    '${propertyList[currentFilterIndex]['rating']}'),
                        buildDescriptionCard('Type : ',    '${propertyList[currentFilterIndex]['types_of_house']}'),
                        buildDescriptionCard('Plot : ',    '${propertyList[currentFilterIndex]['plots']}'),
                        buildDescriptionCard('Bedroom : ',    '${propertyList[currentFilterIndex]['bedroom']}'),
                        buildDescriptionCard('Hall : ',    '${propertyList[currentFilterIndex]['hall']}'),
                        buildDescriptionCard('Kitchen : ',    '${propertyList[currentFilterIndex]['kitchen']}'),
                        buildDescriptionCard('Washroom : ',    '${propertyList[currentFilterIndex]['washroom']}'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}

// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// CarouselSlider(
// options: CarouselOptions(
// height: 200.0,
// enlargeCenterPage: true,
// autoPlay: true,
// aspectRatio: 16 / 9,
// autoPlayCurve: Curves.fastOutSlowIn,
// enableInfiniteScroll: true,
// autoPlayAnimationDuration: Duration(milliseconds: 800),
// viewportFraction: 0.8,
// ),
// items: (propertyList[0]['imageList'] as List<dynamic>).map((item) {
// return Builder(
// builder: (BuildContext context) {
// return Container(
// width: MediaQuery.of(context).size.width,
// margin: EdgeInsets.symmetric(horizontal: 5.0),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.grey[200],
// image: DecorationImage(
// image: NetworkImage(item), // Ensure image URLs are valid
// fit: BoxFit.cover,
// ),
// ),
// );
// },
// );
// }).toList(),
// ),
// const SizedBox(height: 20),
// Wrap(
// children: [
// buildTextMethod('Limited Time ', ThemeHelper.secondaryColors),
// buildTextMethod(
// '${propertyList[0]['building_name']} ',
// ThemeHelper.primaryColors,
// ),
// buildTextMethod('is coming back!', ThemeHelper.secondaryColors),
// ],
// ),
// ...
// ],
// )
