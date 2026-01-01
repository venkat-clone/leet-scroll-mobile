// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_preferences_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EditPreferencesState _$EditPreferencesStateFromJson(Map<String, dynamic> json) {
  return _EditPreferencesState.fromJson(json);
}

/// @nodoc
mixin _$EditPreferencesState {
  // Original saved state from database
  UserPreferencesModel get original =>
      throw _privateConstructorUsedError; // Current form state (being modified)
  UserPreferencesModel get modified =>
      throw _privateConstructorUsedError; // Dropdown data
  List<String> get dropdownItems => throw _privateConstructorUsedError;
  RequestStatus get dropdownStatus =>
      throw _privateConstructorUsedError; // Overall state
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditPreferencesStateCopyWith<EditPreferencesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditPreferencesStateCopyWith<$Res> {
  factory $EditPreferencesStateCopyWith(
    EditPreferencesState value,
    $Res Function(EditPreferencesState) then,
  ) = _$EditPreferencesStateCopyWithImpl<$Res, EditPreferencesState>;
  @useResult
  $Res call({
    UserPreferencesModel original,
    UserPreferencesModel modified,
    List<String> dropdownItems,
    RequestStatus dropdownStatus,
    bool isLoading,
    String? error,
  });

  $UserPreferencesModelCopyWith<$Res> get original;
  $UserPreferencesModelCopyWith<$Res> get modified;
}

/// @nodoc
class _$EditPreferencesStateCopyWithImpl<
  $Res,
  $Val extends EditPreferencesState
>
    implements $EditPreferencesStateCopyWith<$Res> {
  _$EditPreferencesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? original = null,
    Object? modified = null,
    Object? dropdownItems = null,
    Object? dropdownStatus = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            original: null == original
                ? _value.original
                : original // ignore: cast_nullable_to_non_nullable
                      as UserPreferencesModel,
            modified: null == modified
                ? _value.modified
                : modified // ignore: cast_nullable_to_non_nullable
                      as UserPreferencesModel,
            dropdownItems: null == dropdownItems
                ? _value.dropdownItems
                : dropdownItems // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            dropdownStatus: null == dropdownStatus
                ? _value.dropdownStatus
                : dropdownStatus // ignore: cast_nullable_to_non_nullable
                      as RequestStatus,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesModelCopyWith<$Res> get original {
    return $UserPreferencesModelCopyWith<$Res>(_value.original, (value) {
      return _then(_value.copyWith(original: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesModelCopyWith<$Res> get modified {
    return $UserPreferencesModelCopyWith<$Res>(_value.modified, (value) {
      return _then(_value.copyWith(modified: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditPreferencesStateImplCopyWith<$Res>
    implements $EditPreferencesStateCopyWith<$Res> {
  factory _$$EditPreferencesStateImplCopyWith(
    _$EditPreferencesStateImpl value,
    $Res Function(_$EditPreferencesStateImpl) then,
  ) = __$$EditPreferencesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserPreferencesModel original,
    UserPreferencesModel modified,
    List<String> dropdownItems,
    RequestStatus dropdownStatus,
    bool isLoading,
    String? error,
  });

  @override
  $UserPreferencesModelCopyWith<$Res> get original;
  @override
  $UserPreferencesModelCopyWith<$Res> get modified;
}

/// @nodoc
class __$$EditPreferencesStateImplCopyWithImpl<$Res>
    extends _$EditPreferencesStateCopyWithImpl<$Res, _$EditPreferencesStateImpl>
    implements _$$EditPreferencesStateImplCopyWith<$Res> {
  __$$EditPreferencesStateImplCopyWithImpl(
    _$EditPreferencesStateImpl _value,
    $Res Function(_$EditPreferencesStateImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? original = null,
    Object? modified = null,
    Object? dropdownItems = null,
    Object? dropdownStatus = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _$EditPreferencesStateImpl(
        original: null == original
            ? _value.original
            : original // ignore: cast_nullable_to_non_nullable
                  as UserPreferencesModel,
        modified: null == modified
            ? _value.modified
            : modified // ignore: cast_nullable_to_non_nullable
                  as UserPreferencesModel,
        dropdownItems: null == dropdownItems
            ? _value._dropdownItems
            : dropdownItems // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        dropdownStatus: null == dropdownStatus
            ? _value.dropdownStatus
            : dropdownStatus // ignore: cast_nullable_to_non_nullable
                  as RequestStatus,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EditPreferencesStateImpl extends _EditPreferencesState {
  const _$EditPreferencesStateImpl({
    required this.original,
    required this.modified,
    required final List<String> dropdownItems,
    required this.dropdownStatus,
    required this.isLoading,
    required this.error,
  }) : _dropdownItems = dropdownItems,
       super._();

  factory _$EditPreferencesStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditPreferencesStateImplFromJson(json);

  // Original saved state from database
  @override
  final UserPreferencesModel original;
  // Current form state (being modified)
  @override
  final UserPreferencesModel modified;
  // Dropdown data
  final List<String> _dropdownItems;
  // Dropdown data
  @override
  List<String> get dropdownItems {
    if (_dropdownItems is EqualUnmodifiableListView) return _dropdownItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dropdownItems);
  }

  @override
  final RequestStatus dropdownStatus;
  // Overall state
  @override
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'EditPreferencesState(original: $original, modified: $modified, dropdownItems: $dropdownItems, dropdownStatus: $dropdownStatus, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditPreferencesStateImpl &&
            (identical(other.original, original) ||
                other.original == original) &&
            (identical(other.modified, modified) ||
                other.modified == modified) &&
            const DeepCollectionEquality().equals(
              other._dropdownItems,
              _dropdownItems,
            ) &&
            (identical(other.dropdownStatus, dropdownStatus) ||
                other.dropdownStatus == dropdownStatus) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    original,
    modified,
    const DeepCollectionEquality().hash(_dropdownItems),
    dropdownStatus,
    isLoading,
    error,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditPreferencesStateImplCopyWith<_$EditPreferencesStateImpl>
  get copyWith =>
      __$$EditPreferencesStateImplCopyWithImpl<_$EditPreferencesStateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EditPreferencesStateImplToJson(this);
  }
}

abstract class _EditPreferencesState extends EditPreferencesState {
  const factory _EditPreferencesState({
    required final UserPreferencesModel original,
    required final UserPreferencesModel modified,
    required final List<String> dropdownItems,
    required final RequestStatus dropdownStatus,
    required final bool isLoading,
    required final String? error,
  }) = _$EditPreferencesStateImpl;
  const _EditPreferencesState._() : super._();

  factory _EditPreferencesState.fromJson(Map<String, dynamic> json) =
      _$EditPreferencesStateImpl.fromJson;

  @override // Original saved state from database
  UserPreferencesModel get original;
  @override // Current form state (being modified)
  UserPreferencesModel get modified;
  @override // Dropdown data
  List<String> get dropdownItems;
  @override
  RequestStatus get dropdownStatus;
  @override // Overall state
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$EditPreferencesStateImplCopyWith<_$EditPreferencesStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
