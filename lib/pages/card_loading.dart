import 'package:flutter/material.dart';
import 'package:card_loading/card_loading.dart';

class ExampleCardLoading extends StatelessWidget {
  const ExampleCardLoading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading Example"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CardLoading(
                          height: 100,
                          borderRadius: 15,
                          margin: EdgeInsets.only(bottom: 10),
                        ),
                        CardLoading(
                          height: 100,
                          borderRadius: 15,
                          margin: EdgeInsets.only(bottom: 10),
                        ),
                        CardLoading(
                          height: 30,
                          width: 200,
                          borderRadius: 15,
                          margin: EdgeInsets.only(bottom: 10),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
