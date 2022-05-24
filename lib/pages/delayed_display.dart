import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';

class DisplayExample extends StatelessWidget {
  DisplayExample({Key? key}) : super(key: key);
  final Duration initialDelay = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(50)),
            height: 500,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DelayedDisplay(
                  child: Text(
                    'Nasir Ahmad Noori',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white),
                  ),
                ),
                DelayedDisplay(
                  delay: Duration(seconds: initialDelay.inSeconds + 1),
                  child: Text(
                    'Flutter Programming',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DelayedDisplay(
                  delay: Duration(seconds: initialDelay.inSeconds + 2),
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "Subscribe",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                DelayedDisplay(
                  delay: Duration(seconds: initialDelay.inSeconds + 3),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(30)),
                    height: 100,
                    width: 200,
                    child: Center(
                        child: Text(
                      'Afghanistan',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
