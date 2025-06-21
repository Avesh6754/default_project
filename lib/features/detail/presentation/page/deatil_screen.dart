import 'package:carousel_slider/carousel_slider.dart';
import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/core/utils/custome_size_box.dart';
import 'package:default_project/core/utils/global.dart';
import 'package:default_project/features/detail/bloc/details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/status.dart';
import '../widgets/common_widgets_details.dart';
import '../widgets/detail_section.dart';
import '../widgets/image_section.dart';

import '../widgets/smooth_indicator_section.dart';

int currentIndex = 0;

class DeatilScreen extends StatelessWidget {
  final String id;

  const DeatilScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColors,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<DetailsBloc, DetailsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.currentStatus == Status.loading) {
              return Center(
                child: CircularProgressIndicator(
                  color: ThemeHelper.primaryColors,
                ),
              );
            } else if (state.currentStatus == Status.success) {
              final detailsBloc = state.productDetailsModel;
              return (detailsBloc != null)
                  ? Column(
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
                            autoPlayAnimationDuration: Duration(
                              milliseconds: 800,
                            ),
                            viewportFraction: 1,
                            initialPage: state.currentIndex,
                            onPageChanged: (index, reason) {
                              context.read<DetailsBloc>().add(
                                ChangeImageIndexEvent(index),
                              );
                            },
                          ),
                          items: detailsBloc.images.map((item) {
                            return Builder(
                              builder: (BuildContext context) {
                                return buildImageSection(item);
                              },
                            );
                          }).toList(),
                        ),
                        buildDotIndicatorAlign(state, detailsBloc),
                        buildHeightSizedBox(10),

                        Wrap(
                          children: [
                            buildTextMethod(
                              'Limited Time ',
                              ThemeHelper.secondaryColors,
                            ),
                            Text(
                              state.productDetailsModel!.title,
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 25,
                                  height: 1.3,
                                  fontWeight: FontWeight.w700,
                                  color: ThemeHelper.primaryColors,
                                ),
                              ),
                            ),
                            buildTextMethod(
                              'is coming back!',
                              ThemeHelper.secondaryColors,
                            ),
                          ],
                        ),
                        buildHeightSizedBox(5),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: buildTextCommon('Description'),
                        ),
                        buildDetailsSectionExpanded(detailsBloc),
                        buildHeightSizedBox(40),
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: ThemeHelper.primaryColors,
                      ),
                    );
            }
            return Center(child: Text(state.errorMessage));
          },
        ),
      ),
    );
  }
}
