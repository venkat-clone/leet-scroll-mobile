// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get options => throw _privateConstructorUsedError;
  int get correctOption => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  int? get viewsCount => throw _privateConstructorUsedError;
  int? get likesCount => throw _privateConstructorUsedError;
  int? get commentsCount => throw _privateConstructorUsedError;
  int? get matchingTagsCount => throw _privateConstructorUsedError;
  int? get priority => throw _privateConstructorUsedError;
  int? get userRanking => throw _privateConstructorUsedError;
  int? get interestedTagsCount => throw _privateConstructorUsedError;
  String? get codeSnippet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    List<String> options,
    int correctOption,
    String? explanation,
    String difficulty,
    String category,
    List<String> tags,
    int? viewsCount,
    int? likesCount,
    int? commentsCount,
    int? matchingTagsCount,
    int? priority,
    int? userRanking,
    int? interestedTagsCount,
    String? codeSnippet,
  });
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? options = null,
    Object? correctOption = null,
    Object? explanation = freezed,
    Object? difficulty = null,
    Object? category = null,
    Object? tags = null,
    Object? viewsCount = freezed,
    Object? likesCount = freezed,
    Object? commentsCount = freezed,
    Object? matchingTagsCount = freezed,
    Object? priority = freezed,
    Object? userRanking = freezed,
    Object? interestedTagsCount = freezed,
    Object? codeSnippet = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            options: null == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            correctOption: null == correctOption
                ? _value.correctOption
                : correctOption // ignore: cast_nullable_to_non_nullable
                      as int,
            explanation: freezed == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                      as String?,
            difficulty: null == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            viewsCount: freezed == viewsCount
                ? _value.viewsCount
                : viewsCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            likesCount: freezed == likesCount
                ? _value.likesCount
                : likesCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            commentsCount: freezed == commentsCount
                ? _value.commentsCount
                : commentsCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            matchingTagsCount: freezed == matchingTagsCount
                ? _value.matchingTagsCount
                : matchingTagsCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            priority: freezed == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as int?,
            userRanking: freezed == userRanking
                ? _value.userRanking
                : userRanking // ignore: cast_nullable_to_non_nullable
                      as int?,
            interestedTagsCount: freezed == interestedTagsCount
                ? _value.interestedTagsCount
                : interestedTagsCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            codeSnippet: freezed == codeSnippet
                ? _value.codeSnippet
                : codeSnippet // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
    _$QuestionImpl value,
    $Res Function(_$QuestionImpl) then,
  ) = __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    List<String> options,
    int correctOption,
    String? explanation,
    String difficulty,
    String category,
    List<String> tags,
    int? viewsCount,
    int? likesCount,
    int? commentsCount,
    int? matchingTagsCount,
    int? priority,
    int? userRanking,
    int? interestedTagsCount,
    String? codeSnippet,
  });
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
    _$QuestionImpl _value,
    $Res Function(_$QuestionImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? options = null,
    Object? correctOption = null,
    Object? explanation = freezed,
    Object? difficulty = null,
    Object? category = null,
    Object? tags = null,
    Object? viewsCount = freezed,
    Object? likesCount = freezed,
    Object? commentsCount = freezed,
    Object? matchingTagsCount = freezed,
    Object? priority = freezed,
    Object? userRanking = freezed,
    Object? interestedTagsCount = freezed,
    Object? codeSnippet = freezed,
  }) {
    return _then(
      _$QuestionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        options: null == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        correctOption: null == correctOption
            ? _value.correctOption
            : correctOption // ignore: cast_nullable_to_non_nullable
                  as int,
        explanation: freezed == explanation
            ? _value.explanation
            : explanation // ignore: cast_nullable_to_non_nullable
                  as String?,
        difficulty: null == difficulty
            ? _value.difficulty
            : difficulty // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        viewsCount: freezed == viewsCount
            ? _value.viewsCount
            : viewsCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        likesCount: freezed == likesCount
            ? _value.likesCount
            : likesCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        commentsCount: freezed == commentsCount
            ? _value.commentsCount
            : commentsCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        matchingTagsCount: freezed == matchingTagsCount
            ? _value.matchingTagsCount
            : matchingTagsCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        priority: freezed == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as int?,
        userRanking: freezed == userRanking
            ? _value.userRanking
            : userRanking // ignore: cast_nullable_to_non_nullable
                  as int?,
        interestedTagsCount: freezed == interestedTagsCount
            ? _value.interestedTagsCount
            : interestedTagsCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        codeSnippet: freezed == codeSnippet
            ? _value.codeSnippet
            : codeSnippet // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionImpl implements _Question {
  const _$QuestionImpl({
    required this.id,
    required this.title,
    required this.description,
    required final List<String> options,
    required this.correctOption,
    this.explanation,
    required this.difficulty,
    required this.category,
    required final List<String> tags,
    this.viewsCount,
    this.likesCount,
    this.commentsCount,
    this.matchingTagsCount,
    this.priority,
    this.userRanking,
    this.interestedTagsCount,
    this.codeSnippet,
  }) : _options = options,
       _tags = tags;

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  final List<String> _options;
  @override
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final int correctOption;
  @override
  final String? explanation;
  @override
  final String difficulty;
  @override
  final String category;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final int? viewsCount;
  @override
  final int? likesCount;
  @override
  final int? commentsCount;
  @override
  final int? matchingTagsCount;
  @override
  final int? priority;
  @override
  final int? userRanking;
  @override
  final int? interestedTagsCount;
  @override
  final String? codeSnippet;

  @override
  String toString() {
    return 'Question(id: $id, title: $title, description: $description, options: $options, correctOption: $correctOption, explanation: $explanation, difficulty: $difficulty, category: $category, tags: $tags, viewsCount: $viewsCount, likesCount: $likesCount, commentsCount: $commentsCount, matchingTagsCount: $matchingTagsCount, priority: $priority, userRanking: $userRanking, interestedTagsCount: $interestedTagsCount, codeSnippet: $codeSnippet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.correctOption, correctOption) ||
                other.correctOption == correctOption) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.viewsCount, viewsCount) ||
                other.viewsCount == viewsCount) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.matchingTagsCount, matchingTagsCount) ||
                other.matchingTagsCount == matchingTagsCount) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.userRanking, userRanking) ||
                other.userRanking == userRanking) &&
            (identical(other.interestedTagsCount, interestedTagsCount) ||
                other.interestedTagsCount == interestedTagsCount) &&
            (identical(other.codeSnippet, codeSnippet) ||
                other.codeSnippet == codeSnippet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    const DeepCollectionEquality().hash(_options),
    correctOption,
    explanation,
    difficulty,
    category,
    const DeepCollectionEquality().hash(_tags),
    viewsCount,
    likesCount,
    commentsCount,
    matchingTagsCount,
    priority,
    userRanking,
    interestedTagsCount,
    codeSnippet,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(this);
  }
}

abstract class _Question implements Question {
  const factory _Question({
    required final String id,
    required final String title,
    required final String description,
    required final List<String> options,
    required final int correctOption,
    final String? explanation,
    required final String difficulty,
    required final String category,
    required final List<String> tags,
    final int? viewsCount,
    final int? likesCount,
    final int? commentsCount,
    final int? matchingTagsCount,
    final int? priority,
    final int? userRanking,
    final int? interestedTagsCount,
    final String? codeSnippet,
  }) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  List<String> get options;
  @override
  int get correctOption;
  @override
  String? get explanation;
  @override
  String get difficulty;
  @override
  String get category;
  @override
  List<String> get tags;
  @override
  int? get viewsCount;
  @override
  int? get likesCount;
  @override
  int? get commentsCount;
  @override
  int? get matchingTagsCount;
  @override
  int? get priority;
  @override
  int? get userRanking;
  @override
  int? get interestedTagsCount;
  @override
  String? get codeSnippet;
  @override
  @JsonKey(ignore: true)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
