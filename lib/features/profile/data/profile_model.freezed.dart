// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  UserModel get user => throw _privateConstructorUsedError;
  ProfileStatsModel get stats => throw _privateConstructorUsedError;
  UserPreferencesModel get preferences => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
    ProfileModel value,
    $Res Function(ProfileModel) then,
  ) = _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call({
    UserModel user,
    ProfileStatsModel stats,
    UserPreferencesModel preferences,
  });

  $UserModelCopyWith<$Res> get user;
  $ProfileStatsModelCopyWith<$Res> get stats;
  $UserPreferencesModelCopyWith<$Res> get preferences;
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? stats = null,
    Object? preferences = null,
  }) {
    return _then(
      _value.copyWith(
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserModel,
            stats: null == stats
                ? _value.stats
                : stats // ignore: cast_nullable_to_non_nullable
                      as ProfileStatsModel,
            preferences: null == preferences
                ? _value.preferences
                : preferences // ignore: cast_nullable_to_non_nullable
                      as UserPreferencesModel,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileStatsModelCopyWith<$Res> get stats {
    return $ProfileStatsModelCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesModelCopyWith<$Res> get preferences {
    return $UserPreferencesModelCopyWith<$Res>(_value.preferences, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileModelImplCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$ProfileModelImplCopyWith(
    _$ProfileModelImpl value,
    $Res Function(_$ProfileModelImpl) then,
  ) = __$$ProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserModel user,
    ProfileStatsModel stats,
    UserPreferencesModel preferences,
  });

  @override
  $UserModelCopyWith<$Res> get user;
  @override
  $ProfileStatsModelCopyWith<$Res> get stats;
  @override
  $UserPreferencesModelCopyWith<$Res> get preferences;
}

/// @nodoc
class __$$ProfileModelImplCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$ProfileModelImpl>
    implements _$$ProfileModelImplCopyWith<$Res> {
  __$$ProfileModelImplCopyWithImpl(
    _$ProfileModelImpl _value,
    $Res Function(_$ProfileModelImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? stats = null,
    Object? preferences = null,
  }) {
    return _then(
      _$ProfileModelImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserModel,
        stats: null == stats
            ? _value.stats
            : stats // ignore: cast_nullable_to_non_nullable
                  as ProfileStatsModel,
        preferences: null == preferences
            ? _value.preferences
            : preferences // ignore: cast_nullable_to_non_nullable
                  as UserPreferencesModel,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileModelImpl implements _ProfileModel {
  const _$ProfileModelImpl({
    required this.user,
    required this.stats,
    required this.preferences,
  });

  factory _$ProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileModelImplFromJson(json);

  @override
  final UserModel user;
  @override
  final ProfileStatsModel stats;
  @override
  final UserPreferencesModel preferences;

  @override
  String toString() {
    return 'ProfileModel(user: $user, stats: $stats, preferences: $preferences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, stats, preferences);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      __$$ProfileModelImplCopyWithImpl<_$ProfileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileModelImplToJson(this);
  }
}

abstract class _ProfileModel implements ProfileModel {
  const factory _ProfileModel({
    required final UserModel user,
    required final ProfileStatsModel stats,
    required final UserPreferencesModel preferences,
  }) = _$ProfileModelImpl;

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$ProfileModelImpl.fromJson;

  @override
  UserModel get user;
  @override
  ProfileStatsModel get stats;
  @override
  UserPreferencesModel get preferences;
  @override
  @JsonKey(ignore: true)
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
