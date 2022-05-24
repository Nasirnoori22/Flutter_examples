import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';

class Dchart extends StatelessWidget {
  const Dchart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green.shade100,
          title: Text(
            'Chart Example',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 0),
                      child: Row(
                        children: [
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green.shade100,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              height: 200,
                              width: 370,
                              child: DChartLine(
                                data: [
                                  {
                                    'id': 'Line',
                                    'data': [
                                      {'domain': 0, 'measure': 4.1},
                                      {'domain': 2, 'measure': 4},
                                      {'domain': 3, 'measure': 6},
                                      {'domain': 4, 'measure': 1},
                                    ],
                                  },
                                ],
                                lineColor: (lineData, index, id) =>
                                    Colors.amber,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: 200,
                        width: 370,
                        child: DChartPie(
                          data: [
                            {'domain': 'Flutter', 'measure': 28},
                            {'domain': 'React Native', 'measure': 27},
                            {'domain': 'Ionic', 'measure': 20},
                            {'domain': 'Cordova', 'measure': 15},
                          ],
                          fillColor: (pieData, index) => Colors.amber,
                          donutWidth: 30,
                          labelColor: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: 200,
                        width: 370,
                        child: DChartGauge(
                          data: [
                            {'domain': 'Off', 'measure': 50},
                            {'domain': 'Warm', 'measure': 60},
                            {'domain': 'Hot', 'measure': 30},
                          ],
                          fillColor: (pieData, index) {
                            switch (pieData['domain']) {
                              case 'Off':
                                return Colors.green;
                              case 'Warm':
                                return Colors.orange;
                              default:
                                return Colors.red;
                            }
                          },
                          showLabelLine: false,
                          pieLabel: (pieData, index) {
                            return "${pieData['domain']}";
                          },
                          labelPosition: PieLabelPosition.inside,
                          labelPadding: 0,
                          labelColor: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
