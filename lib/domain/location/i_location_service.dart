import 'package:map_bloc/domain/location/location_model.dart';

abstract class ILocationService {
  Stream<LocationModel> get positionStream;
}