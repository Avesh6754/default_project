import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/theme_helper.dart';
import '../../../../core/utils/global.dart';

Container buildFilterContainer(int index) {
  return (currentFilterIndex == index)
      ? Container(
          height: 40,
          width: 104,
          decoration: BoxDecoration(
            color: ThemeHelper.backgroundColors,
            borderRadius: BorderRadius.circular(12),
              boxShadow: [

                // BoxShadow(
                //   color: Colors.white.withOpacity(0.4), // Optional subtle white outer glow
                //   blurStyle: BlurStyle.outer,
                //   blurRadius: 3,
                //   spreadRadius: 1,
                //   offset: Offset(-2, -2),
                // ),
              ],

              border: Border.all(
              color: ThemeHelper.textFieldColors.withOpacity(0.15),
              width: 2
            )
          ),
          alignment: Alignment.center,
          child: Text(
            filterList[index],
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: ThemeHelper.primaryColors),
            ),
          ),
        )
      : Container(
          height: 24,
          width: 76,
          decoration: BoxDecoration(),
          alignment: Alignment.center,
          child: Text(
            filterList[index],
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: ThemeHelper.secondaryColors,
                fontSize: 16,
              ),
            ),
          ),
        );
}
