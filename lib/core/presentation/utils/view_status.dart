import 'package:getx_example/core/infrastructure/datasource/remote/api_exception.dart';
import 'package:getx_example/core/infrastructure/datasource/remote/base_api_response.dart';
import 'package:getx_example/core/infrastructure/datasource/remote/status_code.dart';

sealed class ViewStatus {
  static Future<ViewStatus> guard<T>(
    Future<T> Function() future,
  ) async {
    try {
      final response = await future();
      return ViewSuccess(response);
    } on ApiException catch (e) {
      return ViewFailure(e.statusCode, e.message);
    } catch (e) {
      return ViewFailure(StatusCode.unknown, e.toString());
    }
  }

  static Future<ViewStatus> guardBaseResponse<T>(
    Future<BaseApiResponse<T>> Function() future,
  ) async {
    try {
      final response = await future();
      if (response.isSuccess) {
        return ViewSuccess(response.data);
      } else {
        return ViewFailure(
          response.status ?? StatusCode.unknown,
          response.message ?? 'Something went wrong',
        );
      }
    } on ApiException catch (e) {
      return ViewFailure(e.statusCode, e.message);
    } catch (e) {
      return ViewFailure(StatusCode.unknown, e.toString());
    }
  }
}

class ViewInitial extends ViewStatus {}

class ViewLoading extends ViewStatus {
  ViewLoading([this.progress = 0.0]);

  final double progress;
}

class ViewSuccess<T> extends ViewStatus {
  ViewSuccess(this.data);

  final T? data;
}

class ViewFailure extends ViewStatus {
  ViewFailure(this.errorCode, this.message);

  final int errorCode;
  final String message;
}

// TODO: Maybe use this to show error when no internet
class ViewNetworkConnectionError extends ViewStatus {}
