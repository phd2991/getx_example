import 'package:get/get.dart';
import 'package:getx_example/auth/domain/auth_repository.dart';
import 'package:getx_example/core/presentation/utils/view_status.dart';

class SignInController extends GetxController {
  SignInController(this.repo);

  final AuthRepository repo;

  final Rx<ViewStatus> state = Rx<ViewStatus>(ViewInitial());

  Future<void> signIn(String username, String password) async {
    state
      ..value = ViewLoading()
      ..value = await ViewStatus.guard(() => repo.signIn(username, password));
  }
}
