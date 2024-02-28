import 'package:get/get.dart';
import 'package:getx_example/auth/presentation/sign_in/sign_in_binding.dart';
import 'package:getx_example/auth/presentation/sign_in/sign_in_page.dart';
import 'package:getx_example/auth/presentation/sign_up/sign_up_page.dart';
import 'package:getx_example/common/routes/route_name.dart';

class AppPages {
  static List<GetPage<dynamic>> appPages = [
    GetPage(
      name: RouteNames.initial,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: RouteNames.signUp,
      page: () => const SignUpPage(),
    ),
  ];
}
