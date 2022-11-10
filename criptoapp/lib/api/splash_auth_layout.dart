import 'package:flutter/material.dart';

import 'package:splash_screen_view/SplashScreenView.dart';

import '../ui/homePages.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SplashScreenView(
      navigateRoute: HomePage(),
      duration: 5000,
      imageSize: 200,
      imageSrc: "img/logo2.png",
      text: "Criptomonedas",
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(
        fontSize: 30.0,
      ),
      colors: const [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
    );
  }
}
