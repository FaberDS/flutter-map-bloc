// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:map_bloc/application/location/location_cubit.dart' as _i1033;
import 'package:map_bloc/application/permission/permission_cubit.dart' as _i98;
import 'package:map_bloc/domain/app_life_cycle/i_app_life_cycle_service.dart'
    as _i894;
import 'package:map_bloc/domain/location/i_location_service.dart' as _i585;
import 'package:map_bloc/domain/permission/i_permission_service.dart' as _i648;
import 'package:map_bloc/infrastructure/app_life_cycle/app_life_cycle_service.dart'
    as _i782;
import 'package:map_bloc/infrastructure/location/geolocator_location_serivce.dart'
    as _i25;
import 'package:map_bloc/infrastructure/permission/permission_service.dart'
    as _i176;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i648.IPermissionService>(() => _i176.PermissionService());
    gh.lazySingleton<_i894.IAppLifeCycleService>(
      () => _i782.AppLifeCycleService(),
    );
    gh.lazySingleton<_i585.ILocationService>(
      () => _i25.GeolocatorLocationService(),
    );
    gh.lazySingleton<_i98.PermissionCubit>(
      () => _i98.PermissionCubit(
        gh<_i648.IPermissionService>(),
        gh<_i894.IAppLifeCycleService>(),
      ),
    );
    gh.factory<_i1033.LocationCubit>(
      () => _i1033.LocationCubit(
        gh<_i585.ILocationService>(),
        gh<_i98.PermissionCubit>(),
        gh<_i894.IAppLifeCycleService>(),
      ),
    );
    return this;
  }
}
