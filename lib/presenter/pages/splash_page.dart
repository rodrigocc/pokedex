import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  AnimatedBuilderDemoState createState() => AnimatedBuilderDemoState();
}

class AnimatedBuilderDemoState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      // Initialize the animation controller
      duration: const Duration(seconds: 6),
      vsync: this,
    );

    _controller.forward().then((value) {
      Modular.to.navigate('/home');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Lottie.asset("assets/lottie/pokemon_splash.json",
            repeat: true, height: 100, width: 100),
        Container(height: 15),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [Color(0xFF0089CF), Color(0xFF00CDBA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: const Text(
            "Pokemon",
            style: TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ])),
    );
  }
}
