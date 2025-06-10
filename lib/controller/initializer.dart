import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/language_controller.dart';
import 'package:my_portfolio/firebase_options.dart';
import 'firebase_controller.dart';

class Initializer {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    Get.put(FirebaseController(), permanent: true);
    Get.put(LanguageController(), permanent: true);
  }
}
