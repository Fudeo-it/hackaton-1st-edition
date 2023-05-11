import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsNoContext on AppLocalizations {
  static AppLocalizations? _currentLocalization;

  static AppLocalizations get current {
    if (_currentLocalization == null) {
      _localization.then((value) => _currentLocalization = value);
    }

    assert(_currentLocalization != null,
        'Localizations delegate was null. Try to call S.preheat() in your app\'s main method before trying to access S.current.');
    return _currentLocalization!;
  }

  static Future<void> preheat() async {
    _currentLocalization = await _localization;
  }

  static Future<AppLocalizations> get _localization {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    final preferredLocales = widgetsBinding.window.locales;
    const supportedLocales = AppLocalizations.supportedLocales;
    final locale =
        basicLocaleListResolution(preferredLocales, supportedLocales);
    return AppLocalizations.delegate.load(locale);
  }
}
