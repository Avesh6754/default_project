import 'package:default_project/features/registration/bloc/resgistration_bloc.dart';
import 'package:default_project/features/registration/bloc/resgistration_event.dart';
import 'package:default_project/features/registration/bloc/resgistration_state.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/theme_helper.dart';
import 'image_view.dart';



Widget buildImageUploadContainer(RegistrationState state,BuildContext context) {
  return DottedBorder(
    options: RoundedRectDottedBorderOptions(
      dashPattern: [10,5],
      strokeWidth: 2,
      radius: Radius.circular(16),
      color: ThemeHelper.secondaryColors,

    ),
    child: Container(
      height: 99,
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16)
      ),
      child: state.image != null? CustomImageView(imagePath: state.image!.path.toString(),fit: BoxFit.cover,): Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              context.read<RegistrationBloc>().add(ImagePickerEvent());
            },
            icon: Icon(
              Icons.cloud_upload_outlined,
              color: ThemeHelper.primaryColors,
              size: 37,
            ),
          ),
          Text('Select Image'),
        ],
      ),
    ),
  );
}