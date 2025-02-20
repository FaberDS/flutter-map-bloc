part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  factory LocationState.initial() => LocationState(userLocation: LocationModel.empty());

  const factory LocationState({ required LocationModel userLocation}) = _LocationState;

  const LocationState._();

}

