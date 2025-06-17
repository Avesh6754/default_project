import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/core/utils/custome_size_box.dart';
import 'package:default_project/core/utils/global.dart';
import '../widgets/add_property.dart';
import '../widgets/home_filter.dart';
import '../widgets/list_of _product.dart';
import '../widgets/profile_image_section.dart';


class HomeScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return const HomeScreen();
  }

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeightSizedBox(20),
              buildProfielImage(),
              buildAddPropertyRow(),
              buildHeightSizedBox(15),
              SizedBox(
                height: 40, 
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: filterList.length,
                  itemBuilder: (context, index) => buildFilterContainer(index),
                  separatorBuilder: (context, index) => const SizedBox(width: 10),
                ),
              ),
              buildHeightSizedBox(15),
              Expanded(
                child: ListView.builder(
                  itemCount: propertyList.length,
                  itemBuilder: (context, index) {
                    return PropertyCard(property: propertyList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
