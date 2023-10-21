// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calling_keeper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CallingKeeper {
  String get callingUuid => throw _privateConstructorUsedError;
  bool get isHave => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CallingKeeperCopyWith<CallingKeeper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallingKeeperCopyWith<$Res> {
  factory $CallingKeeperCopyWith(
          CallingKeeper value, $Res Function(CallingKeeper) then) =
      _$CallingKeeperCopyWithImpl<$Res, CallingKeeper>;
  @useResult
  $Res call({String callingUuid, bool isHave});
}

/// @nodoc
class _$CallingKeeperCopyWithImpl<$Res, $Val extends CallingKeeper>
    implements $CallingKeeperCopyWith<$Res> {
  _$CallingKeeperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callingUuid = null,
    Object? isHave = null,
  }) {
    return _then(_value.copyWith(
      callingUuid: null == callingUuid
          ? _value.callingUuid
          : callingUuid // ignore: cast_nullable_to_non_nullable
              as String,
      isHave: null == isHave
          ? _value.isHave
          : isHave // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallingKeeperImplCopyWith<$Res>
    implements $CallingKeeperCopyWith<$Res> {
  factory _$$CallingKeeperImplCopyWith(
          _$CallingKeeperImpl value, $Res Function(_$CallingKeeperImpl) then) =
      __$$CallingKeeperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String callingUuid, bool isHave});
}

/// @nodoc
class __$$CallingKeeperImplCopyWithImpl<$Res>
    extends _$CallingKeeperCopyWithImpl<$Res, _$CallingKeeperImpl>
    implements _$$CallingKeeperImplCopyWith<$Res> {
  __$$CallingKeeperImplCopyWithImpl(
      _$CallingKeeperImpl _value, $Res Function(_$CallingKeeperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callingUuid = null,
    Object? isHave = null,
  }) {
    return _then(_$CallingKeeperImpl(
      callingUuid: null == callingUuid
          ? _value.callingUuid
          : callingUuid // ignore: cast_nullable_to_non_nullable
              as String,
      isHave: null == isHave
          ? _value.isHave
          : isHave // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CallingKeeperImpl implements _CallingKeeper {
  _$CallingKeeperImpl({required this.callingUuid, this.isHave = true});

  @override
  final String callingUuid;
  @override
  @JsonKey()
  final bool isHave;

  @override
  String toString() {
    return 'CallingKeeper(callingUuid: $callingUuid, isHave: $isHave)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallingKeeperImpl &&
            (identical(other.callingUuid, callingUuid) ||
                other.callingUuid == callingUuid) &&
            (identical(other.isHave, isHave) || other.isHave == isHave));
  }

  @override
  int get hashCode => Object.hash(runtimeType, callingUuid, isHave);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallingKeeperImplCopyWith<_$CallingKeeperImpl> get copyWith =>
      __$$CallingKeeperImplCopyWithImpl<_$CallingKeeperImpl>(this, _$identity);
}

abstract class _CallingKeeper implements CallingKeeper {
  factory _CallingKeeper(
      {required final String callingUuid,
      final bool isHave}) = _$CallingKeeperImpl;

  @override
  String get callingUuid;
  @override
  bool get isHave;
  @override
  @JsonKey(ignore: true)
  _$$CallingKeeperImplCopyWith<_$CallingKeeperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
