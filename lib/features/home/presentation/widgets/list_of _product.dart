import 'package:default_project/core/routes/app_routes.dart';
import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/core/utils/custome_size_box.dart';
import 'package:default_project/core/utils/navigater_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyCard extends StatelessWidget {
  final Map<String, dynamic> property;

  const PropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigaterService.pushNextPage(AppRoutes.detailPage);
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
                      child: Container(
                        width: 85,
                        height: 84,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(property['image']),
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
                                property['building_name'],
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              '\$${property['price']}',
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
                                    property['address'],
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
                                  'Plots ${property['plots']}',
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
                                  '${property['discount']} Discount',
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
                                  '${property['rating']}',
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
