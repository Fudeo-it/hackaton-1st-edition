import 'package:hive/hive.dart';

class AppPreferencesRepository {
  static const appPreferencesBox = 'appPreferencesBox';
  static const onboardingDoneKey = 'onboardingDone';
  static const darkModeKey = 'darkMode';

  void setOnboardingDone(bool done) {
    _getBox().put(onboardingDoneKey, done);
  }

  bool isOnboardingDone() {
    return _getBox().get(onboardingDoneKey, defaultValue: false);
  }

  void setDarkMode(bool darkMode) {
    _getBox().put(darkModeKey, darkMode);
  }

  bool isDarkMode() {
    return _getBox().get(darkModeKey, defaultValue: false);
  }

  Box _getBox() {
    return Hive.box(appPreferencesBox);
  }
}