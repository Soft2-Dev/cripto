// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/HomeProvider.dart';
import '../providers/validaCoinsFromProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).getCoins();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final coins = Provider.of<HomeProvider>(context).conis;
    final formProvider = Provider.of<ValidaCoinsFromProvider>(context);
    final provider = Provider.of<HomeProvider>(context);

    List<Widget> itemMap = [];

    if (provider.isDate) {
      itemMap = coins
          .map((e) => Column(
                children: [
                  ListTile(
                    onTap: () {
                      provider.isSelect = e;
                      provider.total = e.currentPrice!;
                      Navigator.pushNamed(context, 'DetalleCoint');
                    },
                    leading: Image(
                      image: NetworkImage(e.image!),
                    ),
                    title: Text(e.name!),
                    subtitle: Text(e.symbol!),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('USD'),
                        Text(
                          e.currentPrice!,
                          style: const TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 2,
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              ))
          .toList();
    } else {
      itemMap = [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: size.height * 0.1),
          child: Text('No Registra Datos CriptoMoneda'),
        )
      ];
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.10),
          child: Column(
            children: [
              Container(
                //padding: EdgeInsets.all(1.5),
                padding: const EdgeInsets.only(left: 15),
                margin: EdgeInsets.only(
                  left: size.width * 0.1,
                  right: size.width * 0.1,
                  top: size.height * 0.02,
                ),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(1, 1),
                          blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: size.width * 0.4,
                        height: 60,
                        child: Form(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            onChanged: (value) => formProvider.dato = value,
                            style: const TextStyle(color: Colors.grey),
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(top: 10),
                                hintText: 'CriptoMoneda',
                                hintStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              provider.getSearchCoins(formProvider.dato);
                            });
                          },
                          child: const Icon(
                            Icons.search_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        body: ListView(children: [...itemMap]),
      ),
    );
  }
}
