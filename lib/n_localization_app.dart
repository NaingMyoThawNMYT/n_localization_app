library n_localization_app;

export 'src/_src_exp.dart';

import 'src/_src_exp.dart';

import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

class NLocalizationApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String localeName;
  final List<Locale> supportedLocales;
  final Map<String, Map<String, String>> localizedValues;
  final ThemeData theme;
  final Widget home;

  const NLocalizationApp({
    super.key,
    required this.navigatorKey,
    required this.localeName,
    required this.supportedLocales,
    required this.localizedValues,
    required this.theme,
    required this.home,
  });

  @override
  State<NLocalizationApp> createState() => NLocalizationAppState();

  static NLocalizationAppState of(BuildContext context) =>
      context.findAncestorStateOfType<NLocalizationAppState>()!;
}

class NLocalizationAppState extends State<NLocalizationApp> {
  Locale? _locale;

  @override
  void initState() {
    super.initState();

    nLocalizationNavigatorKey = widget.navigatorKey;

    _locale = Locale.fromSubtags(languageCode: widget.localeName);
  }

  void setLocale(Locale value) => setState(() => _locale = value);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: nLocalizationNavigatorKey,
      debugShowCheckedModeBanner: false,
      theme: widget.theme,
      localizationsDelegates: [
        NAppLocalizationsDelegate(
          widget.supportedLocales,
          widget.localizedValues,
        ),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: widget.supportedLocales,
      locale: _locale,
      home: widget.home,
    );
  }
}
