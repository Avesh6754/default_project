import 'package:default_project/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/theme_helper.dart';
import '../../../../core/utils/global.dart';

Widget buildFilterContainer(int index) {
  final bool isSelected = currentFilterIndex == index;

  return (isSelected)
      ? Card(
          child: Container(
            height: 40,
            width: 104,
            decoration: BoxDecoration(
              color: ThemeHelper.backgroundColors,

              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: ThemeHelper.backgroundColors.withOpacity(0.1),
                  blurRadius: 6,
                  offset: Offset(-1, 1),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              filterList[index],
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: ThemeHelper.primaryColors,
                ),
              ),
            ),
          ),
        )
      : Container(
          height: 40,
          width: 104,
          decoration: BoxDecoration(
            color: ThemeHelper.backgroundColors.withOpacity(0.9),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            filterList[index],
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: ThemeHelper.secondaryColors,
              ),
            ),
          ),
        );
}

SizedBox buildTabBar(void Function(VoidCallback fn) setState) {
  return SizedBox(
    height: 50,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          setState(() {
            currentFilterIndex = index;
            context.read<HomeBloc>().add(InitialiseEvent(filterList[index].toLowerCase()));
          });
        },
        child: buildFilterContainer(index),
      ),
      separatorBuilder: (context, index) => SizedBox(width: 10),
      itemCount: filterList.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
    ),
  );
}
