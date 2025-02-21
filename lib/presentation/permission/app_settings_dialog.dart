import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_bloc/application/permission/permission_cubit.dart';

class AppSettingsDialog extends StatelessWidget {
  final Function openAppSettings;
  final Function cancelDialog;
  const AppSettingsDialog({
    super.key,
    required this.openAppSettings,
    required this.cancelDialog,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        const Text(
            "You need to open app settings to grant Location Permission"),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                openAppSettings();
              },
              child: const Text("Open App Settings"),
            ),
            TextButton(
              onPressed: () {
                cancelDialog();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}