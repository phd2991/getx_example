import 'package:get/get.dart';
import 'package:getx_example/auth/infrastructure/auth_repository_impl.dart';
import 'package:getx_example/auth/presentation/sign_in/sign_in_controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(AuthRepositoryImpl()),
    );
  }
}
