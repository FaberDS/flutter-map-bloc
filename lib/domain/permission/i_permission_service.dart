import 'package:map_bloc/domain/permission/location_permission_status.dart';

abstract class IPermissionService{

  Future<bool> isLocationPermissionGranted();
  Future<bool> isLocationServicesEnabled();
  Stream<bool> get locationServicesStatusStream;

  Future<LocationPermissionStatus> requestLocationPermission();
}