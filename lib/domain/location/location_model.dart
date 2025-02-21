import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'location_model.freezed.dart';

@freezed
class LocationModel with _$LocationModel {

  factory LocationModel({
    required double latitude,
    required double longitude,
  }) = _LocationModel;
  factory LocationModel.empty() => LocationModel(latitude: 0, longitude: 0);
}