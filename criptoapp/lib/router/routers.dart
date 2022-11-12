import 'package:flutter/material.dart';

import '../api/construcion_page.dart';
import '../api/splash_auth_layout.dart';
import '../ui/detalleCoin.dart';
import '../ui/homePages.dart';

Map<String, WidgetBuilder> getRutas() {
  return <String, WidgetBuilder>{
    'splas': (BuildContext context) => SplashScreenPage(),
    'HomePage': (BuildContext context) => HomePage(),
    'DetalleCoint': (BuildContext context) => DetalleCoint(),
  };
}

Map<String, WidgetBuilder> getNoRutas() {
  return <String, WidgetBuilder>{
    'construccion': (BuildContext context) => Construccion(),
  };
}
