import 'package:flutter/material.dart';

class GradientTest extends StatefulWidget {
  const GradientTest({Key? key}) : super(key: key);

  @override
  State<GradientTest> createState() => _GradientTestState();
}

class _GradientTestState extends State<GradientTest> {
  final List<Color> colorList = const [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.deepPurple,
    Colors.redAccent,
    Colors.lime,
    Colors.orangeAccent,
    Colors.indigo,
    Colors.cyanAccent,
    Colors.deepOrange,
    Colors.amber,
    Colors.blueGrey,
  ];

  int index = 0;
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;
  Color midColor = Colors.blue;

  @override
  void initState() {
    setState(() {
      bottomColor = Colors.blue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        height: 100,
        width: 100,
        duration: const Duration(seconds: 2),
        onEnd: () {
          setState(() {
            index = index + 1;
            // animate the color
            bottomColor = colorList[index % colorList.length];
            midColor = colorList[(index + 1) % colorList.length];
            topColor = colorList[(index + 2) % colorList.length];

            //// animate the alignment
            //  if (alternate) {
            //   begin = alignmentList[index % alignmentList.length];
            //   end = alignmentList[(index + 2) % alignmentList.length];
            // } else {
          });
        },
        decoration: BoxDecoration(
          shape: BoxShape.circle,
            gradient: LinearGradient(stops: const [
          0.0,
          0.4,
          0.8,
        ],
                // begin: begin,
                // end: end,
                colors: [
              bottomColor,
              midColor,
              topColor
            ])),
      ),
    );
  }
}
