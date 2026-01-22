// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiResult<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ApiResult<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApiResult<$T>()';
  }
}

/// @nodoc
class $ApiResultCopyWith<T, $Res> {
  $ApiResultCopyWith(ApiResult<T> _, $Res Function(ApiResult<T>) __);
}

/// Adds pattern-matching-related methods to [ApiResult].
extension ApiResultPatterns<T> on ApiResult<T> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiResultData<T> value)? data,
    TResult Function(ApiResultError<T> value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ApiResultData() when data != null:
        return data(_that);
      case ApiResultError() when error != null:
        return error(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiResultData<T> value) data,
    required TResult Function(ApiResultError<T> value) error,
  }) {
    final _that = this;
    switch (_that) {
      case ApiResultData():
        return data(_that);
      case ApiResultError():
        return error(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiResultData<T> value)? data,
    TResult? Function(ApiResultError<T> value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case ApiResultData() when data != null:
        return data(_that);
      case ApiResultError() when error != null:
        return error(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? data,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ApiResultData() when data != null:
        return data(_that.value);
      case ApiResultError() when error != null:
        return error(_that.error, _that.stackTrace);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) data,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    final _that = this;
    switch (_that) {
      case ApiResultData():
        return data(_that.value);
      case ApiResultError():
        return error(_that.error, _that.stackTrace);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? data,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    final _that = this;
    switch (_that) {
      case ApiResultData() when data != null:
        return data(_that.value);
      case ApiResultError() when error != null:
        return error(_that.error, _that.stackTrace);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ApiResultData<T> implements ApiResult<T> {
  ApiResultData(this.value);

  final T value;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApiResultDataCopyWith<T, ApiResultData<T>> get copyWith =>
      _$ApiResultDataCopyWithImpl<T, ApiResultData<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiResultData<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'ApiResult<$T>.data(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ApiResultDataCopyWith<T, $Res>
    implements $ApiResultCopyWith<T, $Res> {
  factory $ApiResultDataCopyWith(
          ApiResultData<T> value, $Res Function(ApiResultData<T>) _then) =
      _$ApiResultDataCopyWithImpl;
  @useResult
  $Res call({T value});
}

/// @nodoc
class _$ApiResultDataCopyWithImpl<T, $Res>
    implements $ApiResultDataCopyWith<T, $Res> {
  _$ApiResultDataCopyWithImpl(this._self, this._then);

  final ApiResultData<T> _self;
  final $Res Function(ApiResultData<T>) _then;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
  }) {
    return _then(ApiResultData<T>(
      freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class ApiResultError<T> implements ApiResult<T> {
  ApiResultError(this.error, this.stackTrace);

  final Object error;
  final StackTrace stackTrace;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApiResultErrorCopyWith<T, ApiResultError<T>> get copyWith =>
      _$ApiResultErrorCopyWithImpl<T, ApiResultError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiResultError<T> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stackTrace);

  @override
  String toString() {
    return 'ApiResult<$T>.error(error: $error, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $ApiResultErrorCopyWith<T, $Res>
    implements $ApiResultCopyWith<T, $Res> {
  factory $ApiResultErrorCopyWith(
          ApiResultError<T> value, $Res Function(ApiResultError<T>) _then) =
      _$ApiResultErrorCopyWithImpl;
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$ApiResultErrorCopyWithImpl<T, $Res>
    implements $ApiResultErrorCopyWith<T, $Res> {
  _$ApiResultErrorCopyWithImpl(this._self, this._then);

  final ApiResultError<T> _self;
  final $Res Function(ApiResultError<T>) _then;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(ApiResultError<T>(
      null == error ? _self.error : error,
      null == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

// dart format on
