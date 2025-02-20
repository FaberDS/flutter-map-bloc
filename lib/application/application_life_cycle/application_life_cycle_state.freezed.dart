// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_life_cycle_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ApplicationLifeCycleState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() detached,
    required TResult Function() inactive,
    required TResult Function() paused,
    required TResult Function() resumed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? detached,
    TResult? Function()? inactive,
    TResult? Function()? paused,
    TResult? Function()? resumed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? detached,
    TResult Function()? inactive,
    TResult Function()? paused,
    TResult Function()? resumed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Detached value) detached,
    required TResult Function(_Inactive value) inactive,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Resumed value) resumed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Detached value)? detached,
    TResult? Function(_Inactive value)? inactive,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Resumed value)? resumed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Detached value)? detached,
    TResult Function(_Inactive value)? inactive,
    TResult Function(_Paused value)? paused,
    TResult Function(_Resumed value)? resumed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationLifeCycleStateCopyWith<$Res> {
  factory $ApplicationLifeCycleStateCopyWith(
    ApplicationLifeCycleState value,
    $Res Function(ApplicationLifeCycleState) then,
  ) = _$ApplicationLifeCycleStateCopyWithImpl<$Res, ApplicationLifeCycleState>;
}

/// @nodoc
class _$ApplicationLifeCycleStateCopyWithImpl<
  $Res,
  $Val extends ApplicationLifeCycleState
>
    implements $ApplicationLifeCycleStateCopyWith<$Res> {
  _$ApplicationLifeCycleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplicationLifeCycleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DetachedImplCopyWith<$Res> {
  factory _$$DetachedImplCopyWith(
    _$DetachedImpl value,
    $Res Function(_$DetachedImpl) then,
  ) = __$$DetachedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DetachedImplCopyWithImpl<$Res>
    extends _$ApplicationLifeCycleStateCopyWithImpl<$Res, _$DetachedImpl>
    implements _$$DetachedImplCopyWith<$Res> {
  __$$DetachedImplCopyWithImpl(
    _$DetachedImpl _value,
    $Res Function(_$DetachedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApplicationLifeCycleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DetachedImpl extends _Detached {
  const _$DetachedImpl() : super._();

  @override
  String toString() {
    return 'ApplicationLifeCycleState.detached()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DetachedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() detached,
    required TResult Function() inactive,
    required TResult Function() paused,
    required TResult Function() resumed,
  }) {
    return detached();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? detached,
    TResult? Function()? inactive,
    TResult? Function()? paused,
    TResult? Function()? resumed,
  }) {
    return detached?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? detached,
    TResult Function()? inactive,
    TResult Function()? paused,
    TResult Function()? resumed,
    required TResult orElse(),
  }) {
    if (detached != null) {
      return detached();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Detached value) detached,
    required TResult Function(_Inactive value) inactive,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Resumed value) resumed,
  }) {
    return detached(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Detached value)? detached,
    TResult? Function(_Inactive value)? inactive,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Resumed value)? resumed,
  }) {
    return detached?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Detached value)? detached,
    TResult Function(_Inactive value)? inactive,
    TResult Function(_Paused value)? paused,
    TResult Function(_Resumed value)? resumed,
    required TResult orElse(),
  }) {
    if (detached != null) {
      return detached(this);
    }
    return orElse();
  }
}

abstract class _Detached extends ApplicationLifeCycleState {
  const factory _Detached() = _$DetachedImpl;
  const _Detached._() : super._();
}

/// @nodoc
abstract class _$$InactiveImplCopyWith<$Res> {
  factory _$$InactiveImplCopyWith(
    _$InactiveImpl value,
    $Res Function(_$InactiveImpl) then,
  ) = __$$InactiveImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InactiveImplCopyWithImpl<$Res>
    extends _$ApplicationLifeCycleStateCopyWithImpl<$Res, _$InactiveImpl>
    implements _$$InactiveImplCopyWith<$Res> {
  __$$InactiveImplCopyWithImpl(
    _$InactiveImpl _value,
    $Res Function(_$InactiveImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApplicationLifeCycleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InactiveImpl extends _Inactive {
  const _$InactiveImpl() : super._();

  @override
  String toString() {
    return 'ApplicationLifeCycleState.inactive()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InactiveImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() detached,
    required TResult Function() inactive,
    required TResult Function() paused,
    required TResult Function() resumed,
  }) {
    return inactive();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? detached,
    TResult? Function()? inactive,
    TResult? Function()? paused,
    TResult? Function()? resumed,
  }) {
    return inactive?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? detached,
    TResult Function()? inactive,
    TResult Function()? paused,
    TResult Function()? resumed,
    required TResult orElse(),
  }) {
    if (inactive != null) {
      return inactive();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Detached value) detached,
    required TResult Function(_Inactive value) inactive,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Resumed value) resumed,
  }) {
    return inactive(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Detached value)? detached,
    TResult? Function(_Inactive value)? inactive,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Resumed value)? resumed,
  }) {
    return inactive?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Detached value)? detached,
    TResult Function(_Inactive value)? inactive,
    TResult Function(_Paused value)? paused,
    TResult Function(_Resumed value)? resumed,
    required TResult orElse(),
  }) {
    if (inactive != null) {
      return inactive(this);
    }
    return orElse();
  }
}

abstract class _Inactive extends ApplicationLifeCycleState {
  const factory _Inactive() = _$InactiveImpl;
  const _Inactive._() : super._();
}

/// @nodoc
abstract class _$$PausedImplCopyWith<$Res> {
  factory _$$PausedImplCopyWith(
    _$PausedImpl value,
    $Res Function(_$PausedImpl) then,
  ) = __$$PausedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PausedImplCopyWithImpl<$Res>
    extends _$ApplicationLifeCycleStateCopyWithImpl<$Res, _$PausedImpl>
    implements _$$PausedImplCopyWith<$Res> {
  __$$PausedImplCopyWithImpl(
    _$PausedImpl _value,
    $Res Function(_$PausedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApplicationLifeCycleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PausedImpl extends _Paused {
  const _$PausedImpl() : super._();

  @override
  String toString() {
    return 'ApplicationLifeCycleState.paused()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PausedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() detached,
    required TResult Function() inactive,
    required TResult Function() paused,
    required TResult Function() resumed,
  }) {
    return paused();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? detached,
    TResult? Function()? inactive,
    TResult? Function()? paused,
    TResult? Function()? resumed,
  }) {
    return paused?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? detached,
    TResult Function()? inactive,
    TResult Function()? paused,
    TResult Function()? resumed,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Detached value) detached,
    required TResult Function(_Inactive value) inactive,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Resumed value) resumed,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Detached value)? detached,
    TResult? Function(_Inactive value)? inactive,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Resumed value)? resumed,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Detached value)? detached,
    TResult Function(_Inactive value)? inactive,
    TResult Function(_Paused value)? paused,
    TResult Function(_Resumed value)? resumed,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class _Paused extends ApplicationLifeCycleState {
  const factory _Paused() = _$PausedImpl;
  const _Paused._() : super._();
}

/// @nodoc
abstract class _$$ResumedImplCopyWith<$Res> {
  factory _$$ResumedImplCopyWith(
    _$ResumedImpl value,
    $Res Function(_$ResumedImpl) then,
  ) = __$$ResumedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResumedImplCopyWithImpl<$Res>
    extends _$ApplicationLifeCycleStateCopyWithImpl<$Res, _$ResumedImpl>
    implements _$$ResumedImplCopyWith<$Res> {
  __$$ResumedImplCopyWithImpl(
    _$ResumedImpl _value,
    $Res Function(_$ResumedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApplicationLifeCycleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResumedImpl extends _Resumed {
  const _$ResumedImpl() : super._();

  @override
  String toString() {
    return 'ApplicationLifeCycleState.resumed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResumedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() detached,
    required TResult Function() inactive,
    required TResult Function() paused,
    required TResult Function() resumed,
  }) {
    return resumed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? detached,
    TResult? Function()? inactive,
    TResult? Function()? paused,
    TResult? Function()? resumed,
  }) {
    return resumed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? detached,
    TResult Function()? inactive,
    TResult Function()? paused,
    TResult Function()? resumed,
    required TResult orElse(),
  }) {
    if (resumed != null) {
      return resumed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Detached value) detached,
    required TResult Function(_Inactive value) inactive,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Resumed value) resumed,
  }) {
    return resumed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Detached value)? detached,
    TResult? Function(_Inactive value)? inactive,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Resumed value)? resumed,
  }) {
    return resumed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Detached value)? detached,
    TResult Function(_Inactive value)? inactive,
    TResult Function(_Paused value)? paused,
    TResult Function(_Resumed value)? resumed,
    required TResult orElse(),
  }) {
    if (resumed != null) {
      return resumed(this);
    }
    return orElse();
  }
}

abstract class _Resumed extends ApplicationLifeCycleState {
  const factory _Resumed() = _$ResumedImpl;
  const _Resumed._() : super._();
}
