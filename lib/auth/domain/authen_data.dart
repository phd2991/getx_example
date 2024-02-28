import 'package:freezed_annotation/freezed_annotation.dart';

part 'authen_data.freezed.dart';
part 'authen_data.g.dart';

@freezed
class AuthenData with _$AuthenData {
  factory AuthenData({
    String? token,
    String? firstName,
    String? lastName,
  }) = _AuthenData;

  factory AuthenData.fromJson(Map<String, dynamic> json) =>
      _$AuthenDataFromJson(json);
}
