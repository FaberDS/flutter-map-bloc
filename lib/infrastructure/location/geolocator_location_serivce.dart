import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:map_bloc/domain/location/i_location_service.dart';
import 'package:map_bloc/domain/location/location_model.dart';

@LazySingleton(as: ILocationService)
class GeolocatorLocationService implements ILocationService{
  @override
  Stream<LocationModel> get positionStream => Geolocator.getPositionStream(locationSettings: LocationSettings(accuracy: LocationAccuracy.bestForNavigation)).map((location) => LocationModel(latitude: location.latitude, longitude: location.longitude));
}