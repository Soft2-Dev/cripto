// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';

class ValidaCoinsFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();

  String dato = '';

  validateFrom() {
    if (fromkey.currentState!.validate()) {
      print('from valid ... login');

      return true;
    } else {
      print('from not valid');
      return false;
    }
  }
}
