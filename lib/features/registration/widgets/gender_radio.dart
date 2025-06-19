import 'package:default_project/features/registration/bloc/resgistration_bloc.dart';
import 'package:default_project/features/registration/bloc/resgistration_event.dart';
import 'package:default_project/features/registration/bloc/resgistration_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/theme_helper.dart';

Row buildGenderRadio(RegistrationState state,BuildContext context) {
  final gender=(state.gender==1)?"Male":"Female";
  return Row(
    children: [
      Expanded(
        child: RadioListTile(
          materialTapTargetSize: MaterialTapTargetSize.values.first,
          activeColor: ThemeHelper.primaryColors,
          title: Text('Male'),
          value: 'Male',
          groupValue: gender,
          onChanged: (value) {
context.read<RegistrationBloc>().add(OnChangeGenderEvent(value!));
          },
        ),
      ),
      Expanded(
        child: RadioListTile(
          materialTapTargetSize: MaterialTapTargetSize.values.first,
          activeColor: ThemeHelper.primaryColors,
          title: Text('Female'),
          value: 'Female',
          groupValue: gender,
          onChanged: (value) {
            context.read<RegistrationBloc>().add(OnChangeGenderEvent(value!));
          },
        ),
      ),
    ],
  );
}