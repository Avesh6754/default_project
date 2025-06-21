import 'package:default_project/core/routes/app_routes.dart';
import 'package:default_project/core/theme/theme_helper.dart';
import 'package:default_project/core/utils/navigater_service.dart';
import 'package:default_project/features/addproperty/bloc/addproperty_bloc.dart';
import 'package:default_project/features/addproperty/model/add_property_model.dart';
import 'package:default_project/features/home/bloc/home_bloc.dart';
import 'package:default_project/features/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_validation.dart';
import '../../../../core/utils/custome_size_box.dart';
import '../widgets/common_textfield.dart';
import '../widgets/property_details_input.dart';
import '../widgets/property_image_upload.dart';

class AddPropertySection extends StatefulWidget {
  final ProductModel? addProductModal;

  const AddPropertySection({super.key, required this.addProductModal});

  @override
  State<AddPropertySection> createState() => _AddPropertySectionState();
}

class _AddPropertySectionState extends State<AddPropertySection> {
  @override
  void initState() {
    super.initState();
    final data = widget.addProductModal;
    if (data != null) {
      txtTitle.text = data.title;
      txtDescription.text = data.description;
      txtAddress.text = data.address;
      txtPrice.text = data.price.toString();
      txtDiscountPercentage.text = data.discountPercentage.toString();
      txtRating.text = data.rating.toString();
      txtPlot.text = data.plot.toString();
      txtType.text = data.type;
      txtBedroom.text = data.bedroom.toString();
      txtHall.text = data.hall.toString();
      txtKitchen.text = data.kitchen.toString();
      txtWashroom.text = data.washroom.toString();
    }
  }

  var txtTitle = TextEditingController();
  var txtDescription = TextEditingController();

  var txtAddress = TextEditingController();
  var txtPrice = TextEditingController();
  var txtDiscountPercentage = TextEditingController();
  var txtRating = TextEditingController();
  var txtPlot = TextEditingController();
  var txtType = TextEditingController();
  var txtBedroom = TextEditingController();
  var txtHall = TextEditingController();
  var txtKitchen = TextEditingController();
  var txtWashroom = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final updateImage = widget.addProductModal;
    final image=updateImage?.images??[];
    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColors,
      appBar: AppBar(
        backgroundColor: ThemeHelper.lightTheme.appBarTheme.backgroundColor,
        iconTheme: ThemeHelper.lightTheme.appBarTheme.iconTheme,
        title: Text(
          widget.addProductModal == null ? 'Add Property' : 'Update Property',
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: ThemeHelper.backgroundColors,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        titleTextStyle: ThemeHelper.lightTheme.appBarTheme.titleTextStyle,
        leading: IconButton(
          onPressed: () {
            NavigaterService.backPage(AppRoutes.homepage);
          },
          icon: Icon(Icons.arrow_back, color: ThemeHelper.backgroundColors),
        ),
      ),
      body: BlocConsumer<AddPropertyBloc, AddPropertyState>(
        listener: (context, state) {
          if (state.status == Current.success) {
            context.read<HomeBloc>().add(InitialiseEvent('house'));
          }
        },

        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeightSizedBox(15),
                    buildAddPropertyDefaultText(text: 'Building Name'),
                    buildAddPropertyDefaultTextField(
                      isEnabled: false,
                      label: 'Building Name',
                      controller: txtTitle,
                      validator: AppValidations.validateRequired,
                      keyboardType: TextInputType.text,
                      isAddress: false,
                    ),
                    buildHeightSizedBox(10),
                    buildAddPropertyDefaultText(text: 'Apartment Type'),
                    buildAddPropertyDefaultTextField(
                      isEnabled: false,
                      label: 'Row House/Apartment',
                      controller: txtType,
                      keyboardType: TextInputType.text,
                      validator: AppValidations.validateRequired,
                      isAddress: false,
                    ),
                    buildHeightSizedBox(10),
                    buildAddPropertyDefaultText(text: 'Location'),
                    buildAddPropertyDefaultTextField(
                      isEnabled: false,
                      isAddress: true,
                      label: 'flat no 32 / 2nd floor',

                      controller: txtAddress,
                      keyboardType: TextInputType.text,
                      validator: AppValidations.validateRequired,
                    ),
                    buildHeightSizedBox(10),
                    buildAddPropertyDefaultText(text: 'Price'),
                    buildAddPropertyDefaultTextField(
                      isEnabled: false,
                      label: '\$ 1000-2000',
                      controller: txtPrice,
                      keyboardType: TextInputType.number,
                      validator: AppValidations.validateRequired,
                    ),
                    buildHeightSizedBox(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildAddPropertyDefaultText(text: 'Image Upload'),
                        (updateImage?.images!=null)?  TextButton(
                          onPressed: () {
                            setState(() {
                              updateImage?.images.clear();
                            });
                          },
                          child: Text(
                            'Clear All',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: ThemeHelper.primaryColors,
                              ),
                            ),
                          ),
                        ):SizedBox(width: 10,)
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          buildImageAddPropertyContainer(
                            context,
                            state,
                            setState,
                            updateImage?.images??[],
                          ),
                          buildHeightSizedBox(10),
                          buildAddProductDotIndicatorAlign(
                            state,
                            updateImage?.images??[],
                          ),
                        ],
                      ),
                    ),
                    buildHeightSizedBox(10),
                    buildShortTextField(txtRating, txtDiscountPercentage),
                    buildHeightSizedBox(10),
                    Row(
                      children: [
                        buildHeightSizedBox(10),
                        Expanded(
                          child: buildAddPropertyDefaultText(text: 'Plot'),
                        ),
                        Expanded(
                          child: buildAddPropertyDefaultTextField(
                            isEnabled: false,
                            validator: AppValidations.validateRequired,
                            label: '5',
                            controller: txtPlot,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        buildHeightSizedBox(10),
                        Expanded(
                          child: buildAddPropertyDefaultText(text: 'Kitchen'),
                        ),
                        Expanded(
                          child: buildAddPropertyDefaultTextField(
                            isEnabled: false,
                            label: '2',
                            controller: txtKitchen,
                            validator: AppValidations.validateRequired,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    buildHeightSizedBox(10),
                    Row(
                      children: [
                        buildHeightSizedBox(10),
                        Expanded(
                          child: buildAddPropertyDefaultText(text: 'Room'),
                        ),
                        Expanded(
                          child: buildAddPropertyDefaultTextField(
                            isEnabled: false,
                            label: '3',
                            controller: txtBedroom,
                            validator: AppValidations.validateRequired,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        buildHeightSizedBox(10),
                        Expanded(
                          child: buildAddPropertyDefaultText(text: 'Hall'),
                        ),
                        Expanded(
                          child: buildAddPropertyDefaultTextField(
                            isEnabled: false,
                            label: 'eg. 1',
                            controller: txtHall,
                            validator: AppValidations.validateRequired,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    buildHeightSizedBox(10),
                    buildAddPropertyDefaultText(text: 'Washroom'),
                    buildAddPropertyDefaultTextField(
                      isEnabled: false,
                      label: 'eg. 2',
                      controller: txtWashroom,
                      keyboardType: TextInputType.number,
                      validator: AppValidations.validateRequired,
                    ),
                    buildHeightSizedBox(10),
                    buildAddPropertyDefaultText(text: 'Description'),
                    buildAddPropertyDefaultTextField(
                      isAddress: true,
                      isEnabled: false,
                      label:
                          'Lorenum ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      controller: txtDescription,
                      validator: AppValidations.validateRequired,
                      keyboardType: TextInputType.text,
                    ),
                    buildHeightSizedBox(10),
                    ElevatedButton(
                      style: ThemeHelper.lightTheme.elevatedButtonTheme.style,
                      onPressed: () {
                        print("Current mode: ${widget.addProductModal == null ? "Add" : "Update"}");
                        print("Images: ${state.image}");

                        if (formKey.currentState!.validate()) {
                          String thumbnail = (state.image.isNotEmpty && state.image[0].isNotEmpty)
                              ? state.image[0]
                              : (image.isNotEmpty ? image[0] : '');
                          print("Thumbnail: $thumbnail");
                          AddProductModal data = AddProductModal(
                            thumbnail: thumbnail,
                            title: txtTitle.text.trim().toLowerCase(),
                            description: txtDescription.text,
                            address: txtAddress.text,
                            price: txtPrice.text,
                            discountPercentage: double.parse(txtDiscountPercentage.text),
                            rating: txtRating.text,
                            plot: int.parse(txtPlot.text),
                            type: txtType.text.trim().toLowerCase(),
                            bedroom: int.parse(txtBedroom.text),
                            hall: int.parse(txtHall.text),
                            kitchen: int.parse(txtKitchen.text),
                            washroom: int.parse(txtWashroom.text),
                            images: state.image,
                          );

                          if (widget.addProductModal == null) {
                            context.read<AddPropertyBloc>().add(
                              ClickSubmitButtonAddProduct(addProductModal: data),
                            );
                          } else {
                            context.read<AddPropertyBloc>().add(
                              ClickSubmitButtonUpdateProduct(
                                addProductModal: data,
                                productId: widget.addProductModal!.id,
                              ),
                            );
                          }
                          context.read<AddPropertyBloc>().add(ClearAllPickImage());

                          NavigaterService.backPage(AppRoutes.homepage);
                        }
                      },

                      child: Text(
                        widget.addProductModal == null ? 'Add' : 'Update',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: ThemeHelper.backgroundColors,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    buildHeightSizedBox(50),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
