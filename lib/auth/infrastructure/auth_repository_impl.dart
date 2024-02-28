import 'package:get/get.dart';
import 'package:getx_example/auth/domain/auth_repository.dart';
import 'package:getx_example/auth/domain/authen_data.dart';
import 'package:getx_example/core/infrastructure/datasource/local/local_storage_service.dart';
import 'package:getx_example/core/infrastructure/datasource/remote/api_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();
  final ApiService apiClient = Get.find();
  final LocalStorageService storage = Get.find();

  @override
  Future<AuthenData> signIn(
    String userName,
    String password,
  ) {
    return apiClient.requestPost(
      '/auth/login',
      {'username': userName, 'password': password},
      responseFactory: AuthenData.fromJson,
    );
  }
/*
  Future<BaseApiResponse<AuthenData>> baseResponseExample(
    String userName,
    String password,
  ) {
    return apiClient.requestPost(
      '/auth/login',
      {'username': userName, 'password': password},
      responseFactory: (json) =>
          BaseApiResponse.fromJson(json, AuthenData.fromJson),
    );
  }
*/

  Future<void> signout() {
    return apiClient.requestPost('/signOut', null);
  }

  // Save to local
  void saveAuthCredential(AuthenData? authData) {
    storage.accessToken = authData?.token;
  }

  void clearAuthCredential() {
    storage.accessToken = null;
  }

  // Get from local
  bool get isAuthen => storage.accessToken != null;
}
