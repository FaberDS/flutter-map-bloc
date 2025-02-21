import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:map_bloc/domain/app_life_cycle/i_app_life_cycle_service.dart';

@LazySingleton(as:IAppLifeCycleService)
class AppLifeCycleService with WidgetsBindingObserver implements IAppLifeCycleService{
  final StreamController<bool> _isResumedController = StreamController<bool>.broadcast();
  @override
  void didChangeAppLifecycleState(AppLifecycleState lifeCycleState) {
    _isResumedController.add(lifeCycleState == AppLifecycleState.resumed);
  }
  @override
  bool get isResumed => WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed;

  @override
  Stream<bool> get isResumedStream => _isResumedController.stream;

  @override
  Future<void> close() async{
    WidgetsBinding.instance.removeObserver(this);
    _isResumedController.close();
  }
}