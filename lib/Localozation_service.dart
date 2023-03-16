import 'dart:ui';
import 'package:demo/translations/en_US.dart';
import 'package:get/get.dart';
import '../translations/gu_IN.dart';
import '../translations/hi_IN.dart';

class LocalizationService extends Translations {
  static final locale = Locale("en", "US");
  static final fallbacklocale = Locale("en", "US");

  static final Langs = [
    "English",
    "Gujarati",
    "Hindi",
  ];

  static final locales = [
    Locale("en", "US"),
    Locale("gu", "IN"),
    Locale("hi", "IN"),
  ];

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en_US": en,
        "gu_IN": gu,
        "hi_IN": hi,
      };

  void changeLocale(String lang) {
    final locale = getLocaleFromLanguages(lang);
    Get.updateLocale(locale);
  }

  Locale getLocaleFromLanguages(String lang) {
    for (int i = 0; i < Langs.length; i++) {
      if (lang == Langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
