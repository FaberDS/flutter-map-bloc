import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_bloc/application/permission/permission_cubit.dart';
import 'package:map_bloc/presentation/permission/permission_dialog.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            return Colors.black;
          },
        ),
      ),
      onPressed: () {
        debugPrint("Location Services button Pressed!");

        showDialog(
          context: context,
          builder: (BuildContext context) {
            final bool isLocationPermissionGranted = context.select(
                (PermissionCubit element) =>
                    element.state.isLocationPermissionGranted);
            final bool isLocationServicesEnabled = context.select(
                (PermissionCubit element) =>
                    element.state.isLocationServicesEnabled);
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              content: PermissionDialog(
                isLocationPermissionGranted: isLocationPermissionGranted,
                isLocationServicesEnabled: isLocationServicesEnabled,
              ),
            );
          },
        );
      },
      child: const Text("Request Location Permission"),
    );
  }
}