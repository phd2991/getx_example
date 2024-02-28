import 'package:deep_pick/deep_pick.dart';
import 'package:getx_example/common/constants/keys.dart';
import 'package:getx_example/core/infrastructure/datasource/remote/status_code.dart';

// Dart does not support instantiating from a generic type parameter.
// Use a this factory to generate data as you need them.
typedef InitGeneric<T> = T Function(Map<String, dynamic>);

class BaseApiResponse<T> {
  BaseApiResponse({
    this.status,
    this.data,
    this.message,
  });

  BaseApiResponse.fromJson(dynamic json, [InitGeneric<T>? dataFactory])
      : status = pick(json, Keys.statusCode).asIntOrNull(),
        data = dataFactory == null
            ? null
            : pick(json, Keys.data).asMapOrNull<String, dynamic>() == null
                ? null
                : dataFactory(
                    pick(json, Keys.data).asMapOrEmpty<String, dynamic>(),
                  ),
        message = pick(json, Keys.message).asStringOrNull();

  final int? status;
  final T? data;
  final String? message;

  bool get isSuccess => status == StatusCode.success;
}
