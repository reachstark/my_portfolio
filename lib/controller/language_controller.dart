import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  final _languageCode = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    loadLanguage();
  }

  Future<void> loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('languageCode');
    if (languageCode != null) {
      _languageCode.value = languageCode;
    }
  }

  Future<void> toggleLanguage() async {
    if (_languageCode.value == 'en') {
      _languageCode.value = 'km';
    } else {
      _languageCode.value = 'en';
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', _languageCode.value);
  }

  String get currentLanguage => _languageCode.value;
}
