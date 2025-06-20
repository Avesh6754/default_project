import 'dart:io';

import 'package:default_project/core/routes/app_routes.dart';
import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/core/utils/custome_size_box.dart';
import 'package:default_project/core/utils/navigater_service.dart';
import 'package:default_project/features/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../registration/widgets/image_view.dart';

class PropertyCard extends StatelessWidget {
  final ProductModel property;

  const PropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigaterService.pushNextPage(
          AppRoutes.detailPage,
          arguments: property.id,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: ThemeHelper.backgroundColors,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child:
                          (property.images[0] !=
                              'https://i.dummyjson.com/data/products/1/1.jpg')
                          ? Container(
                              width: 85,
                              height: 84,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: FileImage(File(property.thumbnail)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              height: 84,
                              width: 85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage('assets/jpg/buiding2.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),

                    Expanded(
                      flex: 2,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,

                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                property.title,
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              '\$${property.price}',
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ThemeHelper.primaryColors,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildHeightSizedBox(10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 11,
                                  color: Colors.grey,
                                ),
                                Expanded(
                                  child: Text(
                                    property.address,
                                    style: GoogleFonts.lato(
                                      fontSize: 10,
                                      color: ThemeHelper.textFieldColors,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  'Plots ${property.plot}',
                                  style: GoogleFonts.lato(
                                    fontSize: 8,
                                    color: ThemeHelper.textFieldColors,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Container(
                                  height: 16,
                                  child: const VerticalDivider(
                                    color: ThemeHelper.primaryColors,
                                    thickness: 1,
                                  ),
                                ),
                                Text(
                                  '${property.discountPercentage} Discount',
                                  style: GoogleFonts.lato(
                                    fontSize: 8,
                                    color: ThemeHelper.textFieldColors,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                Container(
                                  height: 16,
                                  child: const VerticalDivider(
                                    color: ThemeHelper.primaryColors,
                                    thickness: 1,
                                  ),
                                ),

                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 11,
                                ),

                                Text(
                                  '${property.rating}',
                                  style: GoogleFonts.lato(
                                    fontSize: 8,
                                    color: ThemeHelper.textFieldColors,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
