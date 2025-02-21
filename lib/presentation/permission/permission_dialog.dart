import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_bloc/application/permission/permission_cubit.dart';
import 'package:map_bloc/presentation/permission/app_settings_dialog.dart';

class PermissionDialog extends StatelessWidget {
  final bool isLocationPermissionGranted;
  final bool isLocationServicesEnabled;
  const PermissionDialog({
    super.key,
    required this.isLocationPermissionGranted,
    required this.isLocationServicesEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        const Text(
            "Please allow location permission and services to view your location:)"),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Location Permission: "),
            TextButton(
              onPressed: isLocationPermissionGranted
                  ? null
                  : () {
                      debugPrint("Location permission button pressed!");
                      context
                          .read<PermissionCubit>()
                          .requestLocationPermission();
                    },
              child: Text(isLocationPermissionGranted ? "allowed" : "allow"),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Location Services: "),
            TextButton(
              onPressed: isLocationServicesEnabled
                  ? null
                  : () {
                      debugPrint("Location services button pressed!");
                      context.read<PermissionCubit>().openLocationSettings();
                    },
              child: Text(isLocationServicesEnabled ? "allowed" : "allow"),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}