// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/HomeProvider.dart';

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
    final coins = Provider.of<HomeProvider>(context).conis;
    List<Widget> itemMap = coins
        .map((e) => Column(
              children: [
                ListTile(
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

    return Scaffold(
      body: ListView(children: [...itemMap]),
    );
  }
}
