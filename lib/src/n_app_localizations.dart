import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NAppLocalizations {
  final Locale locale;
  final Map<String, Map<String, String>> localizedValues;

  NAppLocalizations(this.locale, this.localizedValues);

  static NAppLocalizations of(BuildContext context) =>
      Localizations.of<NAppLocalizations>(
        context,
        NAppLocalizations,
      )!;

  String get(String key) {
    try {
      final v = localizedValues[key]![locale.languageCode]!;

      return v.isEmpty ? key : v;
    } catch (_) {
      return key;
    }
  }
}

class NAppLocalizationsDelegate
    extends LocalizationsDelegate<NAppLocalizations> {
  final List<Locale> supportedLocales;
  final Map<String, Map<String, String>> localizedValues;

  const NAppLocalizationsDelegate(this.supportedLocales, this.localizedValues);

  @override
  bool isSupported(Locale locale) {
    for (final l in supportedLocales) {
      if (l.languageCode == locale.languageCode) return true;
    }

    return false;
  }

  @override
  Future<NAppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async 'load' operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<NAppLocalizations>(NAppLocalizations(
      locale,
      localizedValues,
    ));
  }

  @override
  bool shouldReload(NAppLocalizationsDelegate old) => false;
}
