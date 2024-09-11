import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ConfettiController _confittController;
  bool isPlaying = false;

  @override

  void initState() {
    _confittController =
        ConfettiController(duration: const Duration(milliseconds: 800));
    _confittController.play();
    super.initState();
  }

  // @override
  // void dispose() {
  //   _confittController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    if (isPlaying) {
                      _confittController.stop();
                    } else {
                      _confittController.play();
                    }
                    isPlaying = !isPlaying;
                    setState(() {});
                  },
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffff6400),
                      ),
                      child: const Center(
                        child: Text(
                          "Click ON",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 21),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: _confittController,
          blastDirection: pi / 2,
          gravity: 0.09,
          emissionFrequency: 1,
        ),
      ],
    );
  }
}
