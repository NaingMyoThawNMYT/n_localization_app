import 'package:flutter/material.dart';

import 'n_app_localizations.dart';

GlobalKey<NavigatorState>? nLocalizationNavigatorKey;

extension NLocalizationExtension on String {
  String get lz => nLocalizationNavigatorKey?.currentContext == null
      ? this
      : NAppLocalizations.of(nLocalizationNavigatorKey!.currentContext!)
          .get(this);
}
