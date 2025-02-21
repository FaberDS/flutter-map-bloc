import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_compass/flutter_map_compass.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_bloc/application/location/location_cubit.dart';
import 'package:map_bloc/domain/location/location_model_ext.dart';
import 'package:map_bloc/presentation/map/user_marker.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
    required this.mapController,
    required this.locationState,
  });

  final MapController mapController;
  final LocationState locationState;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: locationState.userLocation.latLng(),
        initialZoom: 3.0,
        interactionOptions: InteractionOptions(
                  flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                ),
                maxZoom: 16,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          tileBuilder: (context, tileWidget, tile) => Stack(
            children: [
              Opacity(opacity: 0.2, child: tileWidget),
              Text(
                '${tile.coordinates.z}/${tile.coordinates.x}/${tile.coordinates.y}',
              ),
            ],
          ),
        ),
        // );
        // TileLayer(
        //   urlTemplate:
        //       //'https://stamen-tiles.a.ssl.fastly.net/watercolor/{z}/{x}/{y}.png',
        //       'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        //   userAgentPackageName: 'com.example.map_tutorial',
          
        // ),
        const MapCompass.cupertino(),

        MarkerLayer(
          markers: [
            if (locationState.isUserLocationReady)
              Marker(
                point: locationState.userLocation.latLng(),
                width: 60,
                height: 60,
                child: const UserMarker(),
              ),
          ],
        ),
      ],
    );
  }
}