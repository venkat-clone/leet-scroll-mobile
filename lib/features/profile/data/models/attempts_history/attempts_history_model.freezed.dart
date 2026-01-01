// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attempts_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AttemptsHistoryModel _$AttemptsHistoryModelFromJson(Map<String, dynamic> json) {
  return _AttemptsHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$AttemptsHistoryModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  set userId(String value) => throw _privateConstructorUsedError;
  String get questionId => throw _privateConstructorUsedError;
  set questionId(String value) => throw _privateConstructorUsedError;
  String get selectedOption => throw _privateConstructorUsedError;
  set selectedOption(String value) => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;
  set isCorrect(bool value) => throw _privateConstructorUsedError;
  String get attemptedAt => throw _privateConstructorUsedError;
  set attemptedAt(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttemptsHistoryModelCopyWith<AttemptsHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttemptsHistoryModelCopyWith<$Res> {
  factory $AttemptsHistoryModelCopyWith(
    AttemptsHistoryModel value,
    $Res Function(AttemptsHistoryModel) then,
  ) = _$AttemptsHistoryModelCopyWithImpl<$Res, AttemptsHistoryModel>;
  @useResult
  $Res call({
    String id,
    String userId,
    String questionId,
    String selectedOption,
    bool isCorrect,
    String attemptedAt,
  });
}

/// @nodoc
class _$AttemptsHistoryModelCopyWithImpl<
  $Res,
  $Val extends AttemptsHistoryModel
>
    implements $AttemptsHistoryModelCopyWith<$Res> {
  _$AttemptsHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? questionId = null,
    Object? selectedOption = null,
    Object? isCorrect = null,
    Object? attemptedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            questionId: null == questionId
                ? _value.questionId
                : questionId // ignore: cast_nullable_to_non_nullable
                      as String,
            selectedOption: null == selectedOption
                ? _value.selectedOption
                : selectedOption // ignore: cast_nullable_to_non_nullable
                      as String,
            isCorrect: null == isCorrect
                ? _value.isCorrect
                : isCorrect // ignore: cast_nullable_to_non_nullable
                      as bool,
            attemptedAt: null == attemptedAt
                ? _value.attemptedAt
                : attemptedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AttemptsHistoryModelImplCopyWith<$Res>
    implements $AttemptsHistoryModelCopyWith<$Res> {
  factory _$$AttemptsHistoryModelImplCopyWith(
    _$AttemptsHistoryModelImpl value,
    $Res Function(_$AttemptsHistoryModelImpl) then,
  ) = __$$AttemptsHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String questionId,
    String selectedOption,
    bool isCorrect,
    String attemptedAt,
  });
}

/// @nodoc
class __$$AttemptsHistoryModelImplCopyWithImpl<$Res>
    extends _$AttemptsHistoryModelCopyWithImpl<$Res, _$AttemptsHistoryModelImpl>
    implements _$$AttemptsHistoryModelImplCopyWith<$Res> {
  __$$AttemptsHistoryModelImplCopyWithImpl(
    _$AttemptsHistoryModelImpl _value,
    $Res Function(_$AttemptsHistoryModelImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? questionId = null,
    Object? selectedOption = null,
    Object? isCorrect = null,
    Object? attemptedAt = null,
  }) {
    return _then(
      _$AttemptsHistoryModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        questionId: null == questionId
            ? _value.questionId
            : questionId // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedOption: null == selectedOption
            ? _value.selectedOption
            : selectedOption // ignore: cast_nullable_to_non_nullable
                  as String,
        isCorrect: null == isCorrect
            ? _value.isCorrect
            : isCorrect // ignore: cast_nullable_to_non_nullable
                  as bool,
        attemptedAt: null == attemptedAt
            ? _value.attemptedAt
            : attemptedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AttemptsHistoryModelImpl implements _AttemptsHistoryModel {
  _$AttemptsHistoryModelImpl({
    required this.id,
    required this.userId,
    required this.questionId,
    required this.selectedOption,
    required this.isCorrect,
    required this.attemptedAt,
  });

  factory _$AttemptsHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttemptsHistoryModelImplFromJson(json);

  @override
  String id;
  @override
  String userId;
  @override
  String questionId;
  @override
  String selectedOption;
  @override
  bool isCorrect;
  @override
  String attemptedAt;

  @override
  String toString() {
    return 'AttemptsHistoryModel(id: $id, userId: $userId, questionId: $questionId, selectedOption: $selectedOption, isCorrect: $isCorrect, attemptedAt: $attemptedAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttemptsHistoryModelImplCopyWith<_$AttemptsHistoryModelImpl>
  get copyWith =>
      __$$AttemptsHistoryModelImplCopyWithImpl<_$AttemptsHistoryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AttemptsHistoryModelImplToJson(this);
  }
}

abstract class _AttemptsHistoryModel implements AttemptsHistoryModel {
  factory _AttemptsHistoryModel({
    required String id,
    required String userId,
    required String questionId,
    required String selectedOption,
    required bool isCorrect,
    required String attemptedAt,
  }) = _$AttemptsHistoryModelImpl;

  factory _AttemptsHistoryModel.fromJson(Map<String, dynamic> json) =
      _$AttemptsHistoryModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get userId;
  set userId(String value);
  @override
  String get questionId;
  set questionId(String value);
  @override
  String get selectedOption;
  set selectedOption(String value);
  @override
  bool get isCorrect;
  set isCorrect(bool value);
  @override
  String get attemptedAt;
  set attemptedAt(String value);
  @override
  @JsonKey(ignore: true)
  _$$AttemptsHistoryModelImplCopyWith<_$AttemptsHistoryModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
