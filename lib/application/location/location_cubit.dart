import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:map_bloc/application/permission/permission_cubit.dart';
import 'package:map_bloc/domain/app_life_cycle/i_app_life_cycle_service.dart';
import 'package:map_bloc/domain/location/i_location_service.dart';
import 'package:map_bloc/domain/location/location_model.dart';
import 'package:rxdart/rxdart.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

@injectable // returns a new instance for each call
class LocationCubit extends Cubit<LocationState> {
  final ILocationService _locationService;
  final PermissionCubit _permissionCubit;
  StreamSubscription<LocationModel>? _userPositionSubscription;
  StreamSubscription<List<PermissionState>>? _permissionStatePairSubscription;
  StreamSubscription<bool>? _appLifeCycleSubscription;
  final IAppLifeCycleService _appLifeCycleService;

  LocationCubit(this._locationService, this._permissionCubit,this._appLifeCycleService)
    : super(LocationState.initial()) {
    if (_permissionCubit.state.isLocationPermissionGrantedAndServicesEnabled) {
      _userPositionSubscription = _locationService.positionStream.listen((
        location,
      ) {
        emit(state.copyWith(userLocation: location));
      });
    }
    _permissionStatePairSubscription?.cancel();
    _permissionStatePairSubscription =  _permissionCubit.stream
        .startWith(_permissionCubit.state)
        .pairwise()
        .listen((pair) async {
          final previous = pair.first;
          final current = pair.last;
          if (previous.isLocationPermissionGrantedAndServicesEnabled !=
                  current.isLocationPermissionGrantedAndServicesEnabled &&
              current.isLocationPermissionGrantedAndServicesEnabled) {
            await _userPositionSubscription?.cancel();
            _userPositionSubscription = _locationService.positionStream.listen(
              _userPositionListener,
            );
          } else if (previous.isLocationPermissionGrantedAndServicesEnabled !=
                  current.isLocationPermissionGrantedAndServicesEnabled &&
              !current.isLocationPermissionGrantedAndServicesEnabled) {
            _userPositionSubscription?.cancel();
          }
        });
        _appLifeCycleSubscription?.cancel();
       _appLifeCycleSubscription = _appLifeCycleService.isResumedStream
       .listen((isResumed) async {
          final isLocationPermissionGrantedAndServicesEnabled = _permissionCubit.state.isLocationPermissionGrantedAndServicesEnabled;
          if (isResumed && isLocationPermissionGrantedAndServicesEnabled) {
            await _userPositionSubscription?.cancel();
            _userPositionSubscription = _locationService.positionStream.listen(_userPositionListener);
          } else if(!isResumed) {
            await _userPositionSubscription?.cancel();
          }
        });
  }

  @override
  Future<void> close() async {
    await _userPositionSubscription?.cancel();
    await _permissionStatePairSubscription?.cancel();
    await _appLifeCycleSubscription?.cancel();
    return super.close();
  }

  void _userPositionListener(LocationModel location) {
    emit(state.copyWith(userLocation: location));
  }
}
