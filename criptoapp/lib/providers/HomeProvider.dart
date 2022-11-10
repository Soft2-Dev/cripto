// ignore_for_file: file_names
import 'package:criptoapp/models/modelo_actores.dart';
import 'package:flutter/cupertino.dart';

import '../api/AllApi.dart';

class HomeProvider extends ChangeNotifier {
  List<Coin> conis = [];
  bool isDate = false;

  getCoins() async {
    isDate = false;
    String url =
        '/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';
    print(AllApi.url + url);

    final resp = await AllApi.httpGet(url);
    print(resp);

    final Coins conis = Coins.fromlist(resp);
    if (conis.dato[0].name != '') {
      this.conis = conis.dato;
      isDate = true;
    }
    notifyListeners();
  }

  getSearchCoins(String dato) async {
    isDate = false;

    String url =
        '/coins/markets?vs_currency=usd&ids=$dato&order=market_cap_desc&per_page=100&page=1&sparkline=false';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    print(resp);

    final Coins conis = Coins.fromlist(resp);
    if (conis.dato.length != 0) {
      print('aaaaaaaaaa' + conis.dato.length.toString());

      this.conis = conis.dato;
      isDate = true;
    } else {
      // this.conis.clear();
      print('bbbbbbbbbbbb');
    }
    notifyListeners();
  }
}
