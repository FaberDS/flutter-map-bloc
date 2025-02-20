import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_bloc/application/permission/permission_cubit.dart';

class PermissionDialog extends StatelessWidget {
  final bool isLocationPermissionGranted;
  final bool isLocationServicesEnabled;
const PermissionDialog({ Key? key, required this.isLocationPermissionGranted, required this.isLocationServicesEnabled }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Please allow location permission and services to view your location"),
        const SizedBox(height:15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Location Permission: "),
            TextButton(onPressed: isLocationPermissionGranted 
              ? null 
              : () {
                context.read<PermissionCubit>().requestLocationPermission();
              }
            
            , child:  Text("${isLocationPermissionGranted ? "enabled" : "disabled"}")
            )
          ],),
                  const SizedBox(height:15),
          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Location Services: "),
            TextButton(onPressed: isLocationServicesEnabled 
              ? null 
              : () {
                context.read<PermissionCubit>().openLocationSettings();
              }
            , child:  Text("${isLocationServicesEnabled ? "enabled" : "disabled"}")
               )
          ],),
        const SizedBox(height:15),

      ],);
  }
}