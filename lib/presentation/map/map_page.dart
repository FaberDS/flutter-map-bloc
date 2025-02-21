import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_bloc/application/location/location_cubit.dart';
import 'package:map_bloc/application/permission/permission_cubit.dart';
import 'package:map_bloc/domain/location/location_model.dart';
import 'package:map_bloc/injection.dart';
import 'package:map_bloc/presentation/permission/app_settings_dialog.dart';
import 'package:map_bloc/presentation/permission/location_button.dart';
import 'package:map_bloc/presentation/permission/permission_dialog.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocationCubit>(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<PermissionCubit, PermissionState>(
            listenWhen: (p, c) {
              return p.isLocationPermissionGrantedAndServicesEnabled !=
                      c.isLocationPermissionGrantedAndServicesEnabled &&
                  c.isLocationPermissionGrantedAndServicesEnabled;
            },
            listener: (context, state) {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            },
          ),
          BlocListener<PermissionCubit, PermissionState>(
            listenWhen: (p, c) =>
                p.displayOpenAppSettingsDialog !=
                    c.displayOpenAppSettingsDialog &&
                c.displayOpenAppSettingsDialog,
            listener: (context, state) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    content: AppSettingsDialog(
                      openAppSettings: () {
                        debugPrint("Open App Settings pressed!");
                        context.read<PermissionCubit>().openAppSettings();
                      },
                      cancelDialog: () {
                        debugPrint("Cancel pressed!");
                        context
                            .read<PermissionCubit>()
                            .hideOpenAppSettingsDialog();
                      },
                    ),
                  );
                },
              );
            },
          ),
          BlocListener<PermissionCubit, PermissionState>(
              listenWhen: (p, c) =>
                  p.displayOpenAppSettingsDialog !=
                      c.displayOpenAppSettingsDialog &&
                  !c.displayOpenAppSettingsDialog,
              listener: (context, state) {
                Navigator.of(context).pop();
              }),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Map Tutorial"),
          ),
          body: Stack(
            children: [
              BlocSelector<PermissionCubit, PermissionState, bool>(
                selector: (state) {
                  return state.isLocationPermissionGrantedAndServicesEnabled;
                },
                builder:
                    (context, isLocationPermissionGrantedAndServicesEnabled) {
                  return isLocationPermissionGrantedAndServicesEnabled
                      ? const SizedBox.shrink()
                      : const Positioned(
                          right: 30,
                          bottom: 50,
                          child: LocationButton(),
                        );
                },
              ),
            ],
          )
      ),
    )
    );
  }
}
