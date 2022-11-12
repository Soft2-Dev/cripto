// ignore_for_file: file_names

import 'package:criptoapp/models/modeloHistorico.dart';
import 'package:criptoapp/models/modelo_actores.dart';
import 'package:flutter/cupertino.dart';

import '../api/AllApi.dart';

class HomeProvider extends ChangeNotifier {
  List<Coin> conis = [];
  List<History> historys = [];
  late Coin isSelect;
  bool isDate = false;
  bool isHistory = false;
  late String total;

  calculadora(String dato) {
    if (dato == '') {
      total = '0';
    } else {
      double val = int.parse(dato) * double.parse(isSelect.currentPrice!);
      total = val.toString();
    }
    notifyListeners();
  }

  getCoins() async {
    String url =
        '/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';

    final resp = await AllApi.httpGet(url);

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

    final Coins conis = Coins.fromlist(resp);
    if (conis.dato.isNotEmpty) {
      this.conis = conis.dato;
      isDate = true;
    }
    notifyListeners();
  }

  getHistoryCoins() async {
    String url = '/coins/${isSelect.id}/ohlc?vs_currency=usd&days=1';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final Historys historys = Historys.fromlist(resp);

    this.historys = historys.dato;
    isHistory = true;

    notifyListeners();
  }
}
