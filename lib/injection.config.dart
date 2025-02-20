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
import 'package:map_bloc/application/application_life_cycle/application_life_cycle_cubit.dart'
    as _i398;
import 'package:map_bloc/application/permission/permission_cubit.dart' as _i98;
import 'package:map_bloc/domain/permission/i_permission_service.dart' as _i648;
import 'package:map_bloc/infrastructure/permission/permission_service.dart'
    as _i176;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i398.ApplicationLifeCycleCubit>(
      () => _i398.ApplicationLifeCycleCubit(),
    );
    gh.lazySingleton<_i648.IPermissionService>(() => _i176.PermissionService());
    gh.lazySingleton<_i98.PermissionCubit>(
      () => _i98.PermissionCubit(
        gh<_i648.IPermissionService>(),
        gh<_i398.ApplicationLifeCycleCubit>(),
      ),
    );
    return this;
  }
}
