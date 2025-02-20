import 'package:freezed_annotation/freezed_annotation.dart';

part "application_life_cycle_cubit.dart";
part 'application_life_cycle_state.freezed.dart';

@freezed
class ApplicationLifeCycleState with _$ApplicationLifeCycleState {

  const factory ApplicationLifeCycleState.detached() = _Detached;
  const factory ApplicationLifeCycleState.inactive() = _Inactive;
  const factory ApplicationLifeCycleState.paused() = _Paused;
  const factory ApplicationLifeCycleState.resumed() = _Resumed;

  const ApplicationLifeCycleState._(); // needed for freezed

  bool get isResumed =>  maybeWhen(resumed: () => true, orElse: () => false);
}