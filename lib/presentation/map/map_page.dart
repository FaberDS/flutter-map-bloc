import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_bloc/application/location/location_cubit.dart';
import 'package:map_bloc/application/permission/permission_cubit.dart';
import 'package:map_bloc/domain/location/location_model.dart';
import 'package:map_bloc/injection.dart';
import 'package:map_bloc/presentation/permission/permission_dialog.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocationCubit>(),
      child: BlocListener<PermissionCubit, PermissionState>(
        listenWhen: (p,c) {
          return p.isLocationPermissionGrantedAndServicesEnabled != c.isLocationPermissionGrantedAndServicesEnabled && c.isLocationPermissionGrantedAndServicesEnabled;
        },
        listener: (context, state) {
          Navigator.of(context).pop();
        },
        child: Scaffold(
          appBar: AppBar(title: const Text("Map")),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        final isLocationPermissionGranted = context.select(
                          (PermissionCubit element) =>
                              element.state.isLocationPermissionGranted,
                        );
                        final isLocationServiceEnabled = context.select(
                          (PermissionCubit element) =>
                              element.state.isLocationServicesEnabled,
                        );
                        return AlertDialog(
                          content: PermissionDialog(
                            isLocationPermissionGranted:
                                isLocationPermissionGranted,
                            isLocationServicesEnabled: isLocationServiceEnabled,
                          ),
                        );
                      },
                    );
                  },
                  child: Text("Request Dialog"),
                ),

                const SizedBox(height: 20),
                BlocSelector<LocationCubit, LocationState, LocationModel>(
                  selector: (state) {
                    return state.userLocation;
                  },
                  builder: (context, userLocation) {
                    return Text(
                      "Latitude: ${userLocation.latitude} | longitude: ${userLocation.longitude}",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
