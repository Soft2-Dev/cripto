// ignore_for_file: file_names

import 'package:criptoapp/models/modeloHistorico.dart';
import 'package:criptoapp/models/modelo_actores.dart';
import 'package:flutter/material.dart';

import 'package:flutter_simple_candlesticks/flutter_simple_candlesticks.dart';
import 'package:provider/provider.dart';

import '../providers/HomeProvider.dart';

class DetalleCoint extends StatefulWidget {
  const DetalleCoint({Key? key}) : super(key: key);

  @override
  State<DetalleCoint> createState() => _DetalleCointState();
}

class _DetalleCointState extends State<DetalleCoint> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).getHistoryCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final datos = Provider.of<HomeProvider>(context).isSelect;
    final provider = Provider.of<HomeProvider>(context);
    final history = Provider.of<HomeProvider>(context).historys;

    const style2 = CandlestickChartStyle(
      yLegendStyle: CandlestickChartYLegendStyle(
          textStyle: TextStyle(color: Colors.white),
          numberOfLabels: 5,
          lineStyle:
              CandlestickChartDashedLineStyle(width: 1, color: Colors.white)),
    );

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(datos.name!),
      ),
      body: ListView(
        children: [
          Head(size: size, datos: datos),
          if (provider.isHistory)
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: CandlesticksChart<History>(
                  height: 300,
                  style: style2,
                  data: history,
                  getHightCallback: (e) => double.parse(e.alto.toString()),
                  getCloseCallback: (e) => double.parse(e.cerrado.toString()),
                  getLowCallback: (e) => double.parse(e.bajo.toString()),
                  getOpenCallback: (e) => double.parse(e.abierto.toString()),
                  getTimeCallback: (e) => DateTime.fromMicrosecondsSinceEpoch(
                      int.parse(e.tiempo!))),
            ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text('Calculadora', style: const TextStyle(fontSize: 18)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: size.width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            initialValue: '1',
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                provider.calculadora(value);
                              });
                            },
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 25),
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(top: 10),
                                hintStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.1,
                        child: Text(
                          provider.isSelect.symbol!,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: size.width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              provider.total,
                              style: const TextStyle(fontSize: 25),
                            )),
                      ),
                      SizedBox(
                        width: size.width * 0.1,
                        child: const Text(
                          'USD',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class Head extends StatelessWidget {
  const Head({
    Key? key,
    required this.size,
    required this.datos,
  }) : super(key: key);

  final Size size;
  final Coin datos;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.25,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      decoration: const BoxDecoration(color: Color(0xff303030), boxShadow: [
        BoxShadow(color: Colors.black45, offset: Offset(1, 0), blurRadius: 5)
      ]),
      child: Stack(alignment: Alignment.center, children: [
        Image(image: NetworkImage(datos.image!)),
        Positioned(
          left: 18,
          bottom: 0,
          child: Text(
            '${datos.name!}-${datos.symbol!}',
            style: const TextStyle(fontSize: 18),
          ),
        ),
        Positioned(
          right: 18,
          bottom: 0,
          child: Column(
            children: [
              const Text(
                'USD',
                style: TextStyle(fontSize: 15),
              ),
              Text(datos.currentPrice!,
                  style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ],
          ),
        ),
      ]),
    );
  }
}
