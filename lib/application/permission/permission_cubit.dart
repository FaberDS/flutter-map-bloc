import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_bloc/domain/permission/i_permission_service.dart';
import 'package:map_bloc/domain/permission/location_permission_status.dart';
part 'permission_state.dart';
part 'permission_cubit.freezed.dart';


@lazySingleton // generated get_it code
class PermissionCubit extends Cubit<PermissionState> {

  final IPermissionService _permissionService;
  StreamSubscription? _locationServicesStatusSubscription;
  PermissionCubit(this._permissionService) : super(PermissionState.initial()){
    _permissionService.isLocationPermissionGranted().then((bool isLocationPermissionGranted){
      emit(state.copyWith(isLocationPermissionGranted:isLocationPermissionGranted));
    });

    _permissionService.isLocationServicesEnabled().then((bool isLocationServicesEnabled) {
      emit(state.copyWith(isLocationServicesEnabled: isLocationServicesEnabled));
    });

    _locationServicesStatusSubscription = _permissionService.locationServicesStatusStream.listen((isLocationServicesEnabled) {
      emit(state.copyWith(isLocationServicesEnabled: isLocationServicesEnabled));
    });
  }

  Future<void> requestLocationPermission() async {
    final status = await _permissionService.requestLocationPermission();
    final bool isGranted = status==LocationPermissionStatus.granted;
    emit(state.copyWith(isLocationPermissionGranted: isGranted));
  }

  @override
  Future<void> close() async{
    await _locationServicesStatusSubscription?.cancel();
    super.close();
  }
}
