import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_bloc/application/application_life_cycle/application_life_cycle_cubit.dart';
import 'package:map_bloc/application/permission/permission_cubit.dart';

import '../map/map_page.dart';
import '../../injection.dart';
class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => 
        getIt<PermissionCubit>(),
        lazy: false,
        ),
        BlocProvider(create: (context) => 
        getIt<ApplicationLifeCycleCubit>(),
        lazy: false,
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Map Tutorial Template',
        theme: ThemeData(primarySwatch: Colors.blue),
        home:  const MapPage()
        ),
    );
  }
}
