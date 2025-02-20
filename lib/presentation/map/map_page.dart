import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_bloc/application/location/location_cubit.dart';
import 'package:map_bloc/application/permission/permission_cubit.dart';
import 'package:map_bloc/domain/location/location_model.dart';
import 'package:map_bloc/injection.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocationCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Map")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocSelector<PermissionCubit, PermissionState, bool>(
                selector: (state) {
                  return state.isLocationPermissionGranted;
                },
                builder: (context, isLocationPermissionGranted) {
                  return Text(
                    "Location Permission: ${isLocationPermissionGranted ? "enabled" : "disabled"}",
                  );
                },
              ),
              const SizedBox(height: 20),
              BlocSelector<PermissionCubit, PermissionState, bool>(
                selector: (state) {
                  return state.isLocationServicesEnabled;
                },
                builder: (context, isLocationServicesEnabled) {
                  return Text(
                    "Location Services: ${isLocationServicesEnabled ? "enabled" : "disabled"}",
                  );
                },
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  debugPrint("Location Service Button pressed");
                  context.read<PermissionCubit>().requestLocationPermission();
                },
                child: const Text("Request Location Permission pressed"),
              ),
                            const SizedBox(height: 20),
                            BlocSelector<LocationCubit, LocationState, LocationModel>(
                              selector: (state) {
                                return state.userLocation;
                              },
                              builder: (context, userLocation) {
                                return Text("Latitude: ${userLocation.latitude} | longitude: ${userLocation.longitude}");
                              },
                            )

            ],
          ),
        ),
      ),
    );
  }
}
