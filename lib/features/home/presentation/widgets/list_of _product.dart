import 'dart:io';

import 'package:default_project/core/routes/app_routes.dart';
import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/core/utils/custome_size_box.dart';
import 'package:default_project/core/utils/navigater_service.dart';
import 'package:default_project/features/home/bloc/home_bloc.dart';
import 'package:default_project/features/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../detail/bloc/details_bloc.dart';
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
        context.read<DetailsBloc>().add(InitialisationEvent(property.id));
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return BlocConsumer<HomeBloc, HomeState>(
              buildWhen: (previous, current) =>
                  previous.currentStatus != current.currentStatus,
              listenWhen: (previous, current) =>
                  previous.currentStatus != current.currentStatus,
              listener: (context, state) {
                if (state.currentStatus == Status.success) {
                  print("Product Deleted Successfully");
                  context.read<HomeBloc>().add(InitialiseEvent('house'));
                  Navigator.of(context).pop(); // Close the dialog
                }
              },
              builder: (context, state) {
                return AlertDialog(
                  backgroundColor: ThemeHelper.backgroundColors,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          context.read<HomeBloc>().add(
                            ClickDeletedButtonProductId(
                              property.id,
                              property.type,
                            ),
                          );
                          NavigaterService.backPage(AppRoutes.homepage);
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: ThemeHelper.primaryColors,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Delete',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: ThemeHelper.backgroundColors,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {// Close dialog
                          NavigaterService.pushNextPage(
                            AppRoutes.addPropertyPage,
                            arguments: property,
                          );
                          NavigaterService.backPage(AppRoutes.homepage);
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ThemeHelper.secondaryColors,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Edit',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: ThemeHelper.primaryColors,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        NavigaterService.backPage(AppRoutes.homepage);
                      },
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: ThemeHelper.primaryColors,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
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
                      child: CustomImageView(
                        imagePath: property.images[0],
                        height: 85,
                        width: 85,
                        radius: BorderRadius.circular(10),
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

  Widget _buildSafeFileImage(String path) {
    final file = File(path);
    return file.existsSync()
        ? Container(
            width: 85,
            height: 84,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: FileImage(file), fit: BoxFit.cover),
            ),
          )
        : _buildAssetImage(); // fallback if file doesn't exist
  }

  Widget _buildAssetImage() {
    return Container(
      height: 84,
      width: 85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/jpg/buiding2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
