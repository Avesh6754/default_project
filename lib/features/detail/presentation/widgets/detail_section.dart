import 'package:default_project/features/detail/bloc/details_bloc.dart';
import 'package:default_project/features/detail/model/details_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/theme_helper.dart';
import '../../../../core/utils/global.dart';
import 'common_widgets_details.dart';

Expanded buildDetailsSectionExpanded(DetailsSelectedModel detailsSelectedModel) {
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
                detailsSelectedModel.description,
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: ThemeHelper.textFieldColors,
                ),
              ),
              buildDescriptionCard(
                'Location : ',
                detailsSelectedModel.address,
              ),
              buildDescriptionCard(
                'Price : ',
                '\$ ${ detailsSelectedModel.price}',
              ),
              buildDescriptionCard(
                'Discount : ',
                ' ${ detailsSelectedModel.discountPercentage}',
              ),
              buildDescriptionCard(
                'Rating : ',
                '${ detailsSelectedModel.rating}',
              ),
              buildDescriptionCard(
                'Type : ',
                detailsSelectedModel.type,
              ),
              buildDescriptionCard(
                'Plot : ',
                '${ detailsSelectedModel.plot}',
              ),
              buildDescriptionCard(
                'Bedroom : ',
                '${ detailsSelectedModel.bedroom}',
              ),
              buildDescriptionCard(
                'Hall : ',
                '${ detailsSelectedModel.hall}',
              ),
              buildDescriptionCard(
                'Kitchen : ',
                '${ detailsSelectedModel.kitchen}',
              ),
              buildDescriptionCard(
                'Washroom : ',
                '${ detailsSelectedModel.washroom}',
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
