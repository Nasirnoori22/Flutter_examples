import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class Page_04 extends StatelessWidget {
  const Page_04({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1589133185532-16bf95351db7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2FsZm9ybmlhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          child: DelayedDisplay(
                            delay: Duration(milliseconds: 500),
                            child: Text(
                              'Washington has\na super low\ncrime rate,\nbeatingthe vast\nmajority',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 48.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
