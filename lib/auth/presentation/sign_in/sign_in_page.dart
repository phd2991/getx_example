import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/auth/domain/authen_data.dart';
import 'package:getx_example/auth/domain/value_objects.dart';
import 'package:getx_example/auth/presentation/sign_in/sign_in_controller.dart';
import 'package:getx_example/common/routes/route_name.dart';
import 'package:getx_example/core/presentation/utils/gap.dart';
import 'package:getx_example/core/presentation/utils/view_status.dart';
import 'package:getx_example/core/presentation/widgets/primary_button.dart';
import 'package:getx_example/core/presentation/widgets/text_input.dart';
import 'package:getx_example/l10n/generated/l10n.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Username username = Username('kminchelle');
  Password password = Password('0lelplR');
  final signInFormKey = GlobalKey<FormState>();
  SignInController get controller => GetInstance().find<SignInController>();

  String? verifyPassword(String? password) {
    final verifyPassword = Password(password);
    if (verifyPassword.isValid()) return null;
    return verifyPassword.failure.maybeMap(
      shortPassword: (value) =>
          'Password must be at least ${value.min} characters',
      orElse: () => 'Wrong password',
    );
  }

  String? verifyUsername(String? username) {
    final verifyUsername = Username(username);
    if (verifyUsername.isValid()) return null;
    return verifyUsername.failure.maybeMap(
      empty: (value) => 'Username cannot be empty',
      orElse: () => 'Wrong email',
    );
  }

  void signIn() {
    if (signInFormKey.currentState!.validate()) {
      signInFormKey.currentState!.save();
      controller.signIn(username.value, password.value);
    }
  }

  @override
  void initState() {
    super.initState();
    ever(controller.state, (callback) {
      switch (callback) {
        case ViewInitial():
          showToast('Initial');
        case ViewLoading():
          showToast('Processing...');
        case ViewSuccess<AuthenData>(:final data):
          showToast('Welcome to hell, ${data?.firstName} ${data?.lastName}!');
        case ViewSuccess():
          showToast('Something went wrong');
        case ViewFailure(:final message):
          showToast(message);
        case ViewNetworkConnectionError():
          showToast('Not connected to internet');
      }
    });
  }

  void showToast(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formKey = signInFormKey;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).signIn),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap.h16,
                  TextInput(
                    initialValue: username.value,
                    title: 'Username',
                    lable: 'Nhap username',
                    maxLength: 256,
                    validator: verifyUsername,
                    onSaved: (value) => username = Username(value),
                  ),
                  Gap.h16,
                  TextInput(
                    initialValue: password.value,
                    title: 'Password',
                    lable: 'Nhap password',
                    maxLength: 256,
                    validator: verifyPassword,
                    onSaved: (value) => password = Password(value),
                  ),
                  Gap.h16,
                  Center(
                    child: Obx(
                      () => PrimaryButton(
                        onPressed: signIn,
                        child: controller.state.value is ViewLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text('Sign In'),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed<void>(RouteNames.signUp);
                      },
                      child: const Text('Create an account'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
