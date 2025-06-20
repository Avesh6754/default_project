import 'package:carousel_slider/carousel_slider.dart';
import 'package:default_project/features/addproperty/bloc/addproperty_bloc.dart';
import 'package:default_project/features/registration/widgets/image_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/theme_helper.dart';
import '../../../../core/utils/global.dart';
import '../../../detail/presentation/page/deatil_screen.dart';
import '../../../detail/presentation/widgets/image_section.dart';

Widget
buildImageAddPropertyContainer(BuildContext context,AddPropertyState state,void Function(VoidCallback fn) setState) {
  return DottedBorder(
    options: RoundedRectDottedBorderOptions(
      dashPattern: [10,5],
      strokeWidth: 2,
      radius: Radius.circular(16),
      color: ThemeHelper.secondaryColors,

    ),
    child: Container(
      height: 99,
      width: 200,
      decoration: BoxDecoration(),
      child:(state.image.isNotEmpty)?CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          enlargeCenterPage: true,
          aspectRatio: 16/9,

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
        items: state.image.map((
            item,
            ) {
          return Builder(
            builder: (BuildContext context) {
              return buildAddPageImageSection(item);
            },
          );
        }).toList(),
      ): Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              context.read<AddPropertyBloc>().add(MultiImagePickerFromGallery());
            },
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