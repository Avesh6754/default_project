import 'package:default_project/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

import '../widgets/property_details_input.dart';

class AddPropertySection extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return AddPropertySection();
  }

  const AddPropertySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColors,
      appBar: AppBar(
        backgroundColor: ThemeHelper.lightTheme.appBarTheme.backgroundColor,
        iconTheme: ThemeHelper.lightTheme.appBarTheme.iconTheme,
        title: Text('Add Property'),
        titleTextStyle: ThemeHelper.lightTheme.appBarTheme.titleTextStyle,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: buildAddPropertyTextField(),
        ),
      ),
    );
  }


}
