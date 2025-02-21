import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_bloc/application/location/location_cubit.dart';
import 'package:map_bloc/application/permission/permission_cubit.dart';

import 'package:map_bloc/injection.dart';
import 'package:map_bloc/presentation/map/center_button.dart';
import 'package:map_bloc/presentation/map/map_widget.dart';
import 'package:map_bloc/presentation/map/user_marker.dart';
import 'package:map_bloc/presentation/permission/app_settings_dialog.dart';
import 'package:map_bloc/presentation/permission/location_button.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final mapController = MapController();
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
            listenWhen:
                (p, c) =>
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
            listenWhen:
                (p, c) =>
                    p.displayOpenAppSettingsDialog !=
                        c.displayOpenAppSettingsDialog &&
                    !c.displayOpenAppSettingsDialog,
            listener: (context, state) {
              Navigator.of(context).pop();
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(title: const Text("Map Tutorial")),
          body: BlocBuilder<LocationCubit, LocationState>(
            // buildWhen: (p,c) => p.userLocation != c.userLocation,
            builder: (context, state) {
              return Stack(
                children: [
                  Center(
                child: BlocBuilder<LocationCubit, LocationState>(
                  buildWhen: (p, c) {
                    return p.userLocation != c.userLocation;
                  },
                  builder: (context, locationState) {
                    return MapWidget(mapController: mapController,locationState: locationState,);
                  },
                ),
              ),
                  BlocBuilder<LocationCubit, LocationState>(
                buildWhen: (p, c) {
                  return p.isUserLocationReady != c.isUserLocationReady;
                },
                builder: (context, state) {
                  return !state.isUserLocationReady
                      ? const SizedBox.shrink()
                      : Positioned(
                          left: 30,
                          bottom: 50,
                          child: CenterButton(
                            onPressed: () {
                              mapController.move(
                                LatLng(state.userLocation.latitude,
                                    state.userLocation.longitude),
                                mapController.camera.zoom,
                              );
                            },
                          ),
                        );
                },
              ),
                  BlocSelector<PermissionCubit, PermissionState, bool>(
                    selector: (state) {
                      return state
                          .isLocationPermissionGrantedAndServicesEnabled;
                    },
                    builder: (
                      context,
                      isLocationPermissionGrantedAndServicesEnabled,
                    ) {
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
              );
            },
          ),
        ),
      ),
    );
  }
}



