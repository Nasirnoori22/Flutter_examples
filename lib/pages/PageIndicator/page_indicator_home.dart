import 'package:flutter/material.dart';
import 'package:flutter_examples/pages/PageIndicator/pages/page_01.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_examples/pages/PageIndicator/pages/page_02.dart';
import 'package:flutter_examples/pages/PageIndicator/pages/page_03.dart';
import 'package:flutter_examples/pages/PageIndicator/pages/page_04.dart';

class PageIndicatorHomepage extends StatelessWidget {
  PageIndicatorHomepage({Key? key}) : super(key: key);

  final _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // page view
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: PageView(
              controller: _controller,
              children: const [
                Page_01(),
                Page_02(),
                Page_03(),
                Page_04(),
              ],
            ),
          ),
          Container(
            margin: MediaQuery.of(context).padding - EdgeInsets.only(top: 10),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.black38,
                dotColor: Colors.grey.shade900,
                dotHeight: 5,
                dotWidth: 40,
                spacing: 16,
                //verticalOffset: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
