import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/theme_helper.dart';
import '../../../../core/utils/global.dart';
import 'common_widgets_details.dart';

Expanded buildDetailsSectionExpanded() {
  return Expanded(
    child: Card(
      color: ThemeHelper.backgroundColors,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15),
      ),
      elevation: 50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${propertyList[currentFilterIndex]['description']}',
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: ThemeHelper.textFieldColors,
                ),
              ),
              buildDescriptionCard(
                'Location : ',
                '${propertyList[currentFilterIndex]['address']}',
              ),
              buildDescriptionCard(
                'Price : ',
                '\$ ${propertyList[currentFilterIndex]['price']}',
              ),
              buildDescriptionCard(
                'Discount : ',
                ' ${propertyList[currentFilterIndex]['discount']}',
              ),
              buildDescriptionCard(
                'Rating : ',
                '${propertyList[currentFilterIndex]['rating']}',
              ),
              buildDescriptionCard(
                'Type : ',
                '${propertyList[currentFilterIndex]['types_of_house']}',
              ),
              buildDescriptionCard(
                'Plot : ',
                '${propertyList[currentFilterIndex]['plots']}',
              ),
              buildDescriptionCard(
                'Bedroom : ',
                '${propertyList[currentFilterIndex]['bedroom']}',
              ),
              buildDescriptionCard(
                'Hall : ',
                '${propertyList[currentFilterIndex]['hall']}',
              ),
              buildDescriptionCard(
                'Kitchen : ',
                '${propertyList[currentFilterIndex]['kitchen']}',
              ),
              buildDescriptionCard(
                'Washroom : ',
                '${propertyList[currentFilterIndex]['washroom']}',
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
