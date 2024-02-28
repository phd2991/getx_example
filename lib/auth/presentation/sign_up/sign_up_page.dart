import 'package:flutter/material.dart';
import 'package:getx_example/l10n/generated/l10n.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).signUpAppBarTitle)),
    );
  }
}
