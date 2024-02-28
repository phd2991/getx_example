import 'package:getx_example/auth/domain/authen_data.dart';

mixin AuthRepository {
  Future<AuthenData> signIn(String email, String password);
}
