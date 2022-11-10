// ignore_for_file: file_names
import 'package:criptoapp/models/modelo_actores.dart';
import 'package:flutter/cupertino.dart';

import '../api/AllApi.dart';

class HomeProvider extends ChangeNotifier {
  List<Coin> conis = [];

  getCoins() async {
    String url =
        '/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';
    print(AllApi.url + url);

    final resp = await AllApi.httpGet(url);
    print(resp);

    final Coins conis = Coins.fromlist(resp);
    print(conis.dato[0].name);
    this.conis = conis.dato;
    notifyListeners();
  }
}
