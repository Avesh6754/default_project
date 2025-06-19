import 'package:default_project/core/routes/app_routes.dart';
import 'package:default_project/core/utils/navigater_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/theme_helper.dart';

Row buildAddPropertyRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'jamesbutler@gmail.com',
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 12,
            color: ThemeHelper.textFieldColors,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      InkWell(
        onTap: () {
          NavigaterService.pushNextPage(AppRoutes.addPropertyPage);
        },
        child: Container(
          height: 39,
          width: 112,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: Color(0xffFFDFD0)),
          ),
          alignment: Alignment.center,
          child: Text(
            '+ Add Property',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: ThemeHelper.primaryColors,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
