import 'package:latlong2/latlong.dart';
import 'package:map_bloc/domain/location/location_model.dart';

extension LocationModelExt on LocationModel {
  LatLng latLng(){
    return LatLng(latitude, longitude);
  }
}