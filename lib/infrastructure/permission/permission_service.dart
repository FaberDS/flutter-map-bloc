import 'package:injectable/injectable.dart';
import 'package:map_bloc/domain/permission/i_permission_service.dart';
import 'package:map_bloc/domain/permission/location_permission_status.dart';
import 'package:geolocator/geolocator.dart';

@LazySingleton(as: IPermissionService)
class PermissionService implements IPermissionService{
  @override
  Future<bool> isLocationPermissionGranted()async {
    final status = await Geolocator.checkPermission();
    print("status__: ${status}");
    final bool isGranted = status==LocationPermission.always || status==LocationPermission.whileInUse;
    return isGranted;
  }

  @override
  Future<bool> isLocationServicesEnabled() async {
    return Geolocator.isLocationServiceEnabled();
  }

  @override
  Stream<bool> get locationServicesStatusStream => Geolocator.getServiceStatusStream().map((status) => status == ServiceStatus.enabled );

  @override
  Future<LocationPermissionStatus> requestLocationPermission() async {
    final status = await Geolocator.requestPermission();
    LocationPermissionStatus result = LocationPermissionStatus.granted;

    if (status == LocationPermission.deniedForever) {
      result = LocationPermissionStatus.deniedForever;
    } else if (status == LocationPermission.denied || status == LocationPermission.unableToDetermine) {
      result = LocationPermissionStatus.denied;
    } 

    return result;
  }
  
  @override
  Future<void> openAppSettings() {
    return Geolocator.openAppSettings();
  }
  
  @override
  Future<void> openLocationSettings() {
    return Geolocator.openLocationSettings();
  }
}