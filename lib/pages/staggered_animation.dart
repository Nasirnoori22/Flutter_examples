import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StaggeredAnimation extends StatelessWidget {
  const StaggeredAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Staggered Animation'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 1000),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, right: 20, bottom: 10, left: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://media.stadiumtalk.com/c7/c6/c7c6dbf8af7e4541a9428b1b61c44a58.jpeg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        height: MediaQuery.of(context).size.height / 3,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 30,
                              left: 20,
                              child: Container(
                                child: Text(
                                  'FIFA Ratings for Best\nPlayers in the World',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
