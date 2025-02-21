import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_bloc/domain/app_life_cycle/i_app_life_cycle_service.dart';
import 'package:map_bloc/domain/permission/i_permission_service.dart';
import 'package:map_bloc/domain/permission/location_permission_status.dart';

part 'permission_state.dart';
part 'permission_cubit.freezed.dart';

@lazySingleton // generated get_it code
class PermissionCubit extends Cubit<PermissionState> {

  final IPermissionService _permissionService;
  StreamSubscription? _locationServicesStatusSubscription;
  StreamSubscription<bool>? _appLifeCycleSubscription;
  final IAppLifeCycleService _appLifeCycleService;
  PermissionCubit(this._permissionService, this._appLifeCycleService) : super(PermissionState.initial()){
    _permissionService.isLocationPermissionGranted().then((bool isLocationPermissionGranted){
      emit(state.copyWith(isLocationPermissionGranted:isLocationPermissionGranted));
    });

    _permissionService.isLocationServicesEnabled().then((bool isLocationServicesEnabled) {
      emit(state.copyWith(isLocationServicesEnabled: isLocationServicesEnabled));
    });

    _locationServicesStatusSubscription = _permissionService.locationServicesStatusStream.listen((isLocationServicesEnabled) {
      emit(state.copyWith(isLocationServicesEnabled: isLocationServicesEnabled));
    });
    _appLifeCycleSubscription?.cancel();
    // pairwise return current and previous state
    _appLifeCycleSubscription = _appLifeCycleService.isResumedStream
    .listen((isResumed) async {
      if(isResumed) {
        bool isGranted = await _permissionService.isLocationPermissionGranted();
        if(state.isLocationPermissionGranted!=isGranted && isGranted) {
          print("previous.isResumed != current.isResumed && current.isResumed: hideOpenAppSettingsDialog");
            hideOpenAppSettingsDialog();
        }
        emit(state.copyWith(isLocationPermissionGranted:isGranted));
      }
    }
    );
  }

  Future<void> requestLocationPermission() async {
    final status = await _permissionService.requestLocationPermission();
    final bool displayOpenAppSettingsDialog = status==LocationPermissionStatus.deniedForever;
    final bool isGranted = status==LocationPermissionStatus.granted;
    emit(state.copyWith(isLocationPermissionGranted: isGranted,displayOpenAppSettingsDialog:displayOpenAppSettingsDialog));
  }

  @override
  Future<void> close() async{
    await _locationServicesStatusSubscription?.cancel();
    await _appLifeCycleSubscription?.cancel();
    return super.close();
  }

  Future<void> openAppSettings() async {
    await _permissionService.openAppSettings();
  }

  Future<void> openLocationSettings() async {
    await _permissionService.openLocationSettings();
  }

  void hideOpenAppSettingsDialog(){
    emit(state.copyWith(displayOpenAppSettingsDialog: false));
  }
}
