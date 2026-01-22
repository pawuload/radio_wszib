// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_localizations.dart';

// **************************************************************************
// UtopiaLocalizationGenerator
// **************************************************************************

// ignore_for_file: unnecessary_raw_strings,leading_newlines_in_multiline_strings,no_leading_underscores_for_local_identifiers,prefer_final_locals,join_return_with_assignment
const appLocalizationsData = UtopiaLocalizationData<AppLocalizationsData>({
  'en': AppLocalizationsData(common: AppLocalizationsDataCommon(ok: r"""OK""")),
});

class AppLocalizationsData {
  const AppLocalizationsData({required this.common});

  final AppLocalizationsDataCommon common;
  factory AppLocalizationsData.fromJson(Map<String, Object?> map) =>
      AppLocalizationsData(
        common: AppLocalizationsDataCommon.fromJson(
          map['common']! as Map<String, Object?>,
        ),
      );
  Map<String, Object?> toJson() => {'common': common.toJson()};

  AppLocalizationsData copyWith({AppLocalizationsDataCommon? common}) =>
      AppLocalizationsData(common: common ?? this.common);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsData && common == other.common);
  @override
  int get hashCode => runtimeType.hashCode ^ common.hashCode;
}

class AppLocalizationsDataCommon {
  const AppLocalizationsDataCommon({required this.ok});

  final String ok;
  factory AppLocalizationsDataCommon.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataCommon(ok: map['ok']! as String);
  Map<String, Object?> toJson() => {'ok': ok};

  AppLocalizationsDataCommon copyWith({String? ok}) =>
      AppLocalizationsDataCommon(ok: ok ?? this.ok);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataCommon && ok == other.ok);
  @override
  int get hashCode => runtimeType.hashCode ^ ok.hashCode;
}
