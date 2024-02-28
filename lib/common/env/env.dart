import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/app.dart';
import 'package:getx_example/common/env/env_fields.dart';
import 'package:getx_example/core/infrastructure/datasource/local/local_storage_service.dart';
import 'package:getx_example/core/infrastructure/datasource/remote/api_service.dart';
import 'package:getx_example/core/infrastructure/service/local_notify.dart';

abstract base class Env implements EnvFields {
  Env() {
    instance = this;
    _init();
  }

  static late Env instance;

  Future<void> _init() async {
    await runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        debugPrint('$appMode ready !!! ');

        if (!kIsWeb) {
          LocalNotificationService.initialize();

          await Firebase.initializeApp(options: firebaseOptions);

          debugPrint(await FirebaseMessaging.instance.getToken());

          FirebaseMessaging.onMessage
              .listen(LocalNotificationService.displayData);
        }
        await initServices();
        runApp(const App());
      },
      (error, stackTrace) => debugPrint(error.toString()),
    );
  }

  Future<void> initServices() async {
    await Get.putAsync(() async => ApiService());
    await Get.putAsync(() async => LocalStorageService());
  }
}
