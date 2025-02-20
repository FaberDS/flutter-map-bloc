import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:map_bloc/application/application_life_cycle/application_life_cycle_state.dart';

part 'application_life_cycle_cubit.freezed.dart';
part 'application_life_cycle_state.dart';

@lazySingleton
class ApplicationLifeCycleCubit extends Cubit<ApplicationLifeCycleState> with WidgetsBindingObserver{
  ApplicationLifeCycleCubit() 
  : super(const ApplicationLifeCycleState.resumed()) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> close(){
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed) {
      emit(ApplicationLifeCycleState.resumed());
    } else if(state == AppLifecycleState.detached) {
      emit(ApplicationLifeCycleState.detached());
    } else if(state == AppLifecycleState.paused) {
      emit(ApplicationLifeCycleState.paused());
    } else if(state == AppLifecycleState.inactive) {
      emit(ApplicationLifeCycleState.inactive());
    }
  }
}