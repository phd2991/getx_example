import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/common/routes/app_pages.dart';
import 'package:getx_example/l10n/generated/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF13B9FF),
      ),
      localizationsDelegates: S.localizationsDelegates,
      supportedLocales: S.supportedLocales,
      getPages: AppPages.appPages,
    );
  }
}
