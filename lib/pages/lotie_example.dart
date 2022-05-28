import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LotieAnimation extends StatefulWidget {
  const LotieAnimation({Key? key}) : super(key: key);

  @override
  State<LotieAnimation> createState() => _LotieAnimationState();
}

class _LotieAnimationState extends State<LotieAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }
  }

  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Lottie.network(
              'https://assets3.lottiefiles.com/packages/lf20_vmollwvl.json',
              controller: _controller,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height / 13,
            child: MaterialButton(
              color: Color(0xff8f0f10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black)),
              onPressed: () {
                setState(() {
                  isPlaying = !isPlaying;
                  if (isPlaying) {
                    _controller.repeat();
                  } else {
                    _controller.stop();
                  }
                });
              },
              child: Text(
                isPlaying ? 'Stop Me' : 'Start Me',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
