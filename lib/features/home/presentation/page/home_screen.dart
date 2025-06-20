import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:default_project/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/core/utils/custome_size_box.dart';
import 'package:default_project/core/utils/global.dart';
import '../widgets/add_property.dart';
import '../widgets/home_filter.dart';
import '../widgets/list_of _product.dart';
import '../widgets/profile_image_section.dart';

class HomeScreen extends StatefulWidget {
  static Widget builder(BuildContext context) {
    return const HomeScreen();
  }

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(InitialiseEvent());
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Theme.of(context).secondaryHeaderColor,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeightSizedBox(20),
                buildProfielImage(),
                buildAddPropertyRow(),
                buildHeightSizedBox(15),
                buildTabBar(setState),

                buildHeightSizedBox(15),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                   if(state.currentStatus==Status.loading)
                     {
                       return Center(child: CircularProgressIndicator(),);
                     }
                   else if(state.currentStatus==Status.success)
                     {
                       return Expanded(
                         child: ListView.builder(
                           itemCount: state.productList!.data.length,
                           itemBuilder: (context, index) {
                             return PropertyCard(property: state.productList!.data[index],);
                           },
                         ),
                       );
                     }
                   return Center(child: Text('Data Not Found'),);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// labelColor: Theme.of
// (
// context).customColors.primaryColor,unselectedLabelColor: Colors.black54,indicatorSize: TabBarIndicatorSize.tab,dividerColor: Colors.transparent,labelPadding: EdgeInsets.all(0.r),indicator: ShapeDecoration( color:Theme.of(context).customColors.secondaryColor, shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.r), ), shadows: [ BoxShadow( color: Theme.of(context).customColors.borderColor, offset: Offset(-1, 1), blurRadius: 5.
// r
// )
// ]
// )
// ,