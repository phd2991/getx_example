import 'package:getx_example/core/infrastructure/datasource/remote/api_exception.dart';
import 'package:getx_example/core/infrastructure/datasource/remote/base_api_response.dart';
import 'package:getx_example/core/infrastructure/datasource/remote/status_code.dart';

enum ServiceStatus { initial, loading, completed, failure }

class ServiceResponse<T> {
  ServiceResponse.initial() : status = ServiceStatus.initial;

  ServiceResponse.loading([this.progress]) : status = ServiceStatus.loading;

  ServiceResponse.completed(this.data) : status = ServiceStatus.completed;

  ServiceResponse.failure(this.errorCode, this.message)
      : status = ServiceStatus.failure,
        debugMessage = message;

  ServiceStatus status;
  T? data;
  int? responseCode;
  String? message;
  double? progress;
  int? errorCode;
  String? debugMessage;

  @override
  String toString() {
    return 'Status : $status \n Message : $message \n Data : $data';
  }

  static Future<ServiceResponse<T>> guard<T>(
    Future<BaseApiResponse<T>> Function() future,
  ) async {
    try {
      final response = await future();
      if (response.isSuccess) {
        return ServiceResponse.completed(response.data);
      } else {
        return ServiceResponse.failure(response.status, response.message);
      }
    } on ApiException catch (e) {
      return ServiceResponse.failure(e.statusCode, e.message);
    } catch (e) {
      return ServiceResponse.failure(StatusCode.unknown, e.toString());
    }
  }

  bool isInitial() => status == ServiceStatus.initial;
  bool isLoading() => status == ServiceStatus.loading;
  bool isSuccess() => status == ServiceStatus.completed;
  bool isError() => status == ServiceStatus.failure;
}
