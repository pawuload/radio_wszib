import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@freezed
sealed class ApiResult<T> with _$ApiResult<T> {
  factory ApiResult.data(T value) = ApiResultData;
  factory ApiResult.error(Object error, StackTrace stackTrace) = ApiResultError;
}