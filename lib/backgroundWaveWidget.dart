import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:live_gradient/test.dart';

class BackGroundWaveWidget extends StatefulWidget {
  const BackGroundWaveWidget(
      {Key? key,
      required this.waveLength,
      //required this.color,
      required this.firstWaveTime,
      required this.backgroundWaveStarting,
      required this.backgroundWaveEnding,
      required this.colorStartIndex,
      required this.topPosition,
      required this.isAlternate})
      : super(key: key);
  final double waveLength;
  //final List<Color> color;
  final int firstWaveTime;
  final double backgroundWaveStarting;
  final double backgroundWaveEnding;
  final double topPosition;
  final int colorStartIndex;
  final bool isAlternate;

  @override
  State<BackGroundWaveWidget> createState() => _BackGroundWaveWidgetState();
}

class _BackGroundWaveWidgetState extends State<BackGroundWaveWidget> {
  late int firstWaveTime = widget.firstWaveTime * 1000;
  late double backgroundWaveStarting = widget.backgroundWaveStarting;
  late List<Color> color = [Colors.green[300]!, Colors.purple[300]!];
  late double backgroundWaveEnding = widget.backgroundWaveEnding;
  late List<Color> tempColorSaver;
  //late int firstWaveTime = widget.firstWaveTime;

  List<Color> colorList = [
    // Colors.red,
    Colors.pink[100]!,
    Colors.blue[200]!,
    Colors.green[300]!,
    Colors.purple[300]!,
    Colors.yellow,
    Colors.orange[200]!,
  ];
  int colorIndex = 0;
  @override
  void initState() {
    // if (widget.isAlternate) {
    // backgroundWaveStarting = widget.backgroundWaveStarting;
    // backgroundWaveEnding = widget.backgroundWaveEnding;
    // } else {
    //   backgroundWaveStarting = widget.backgroundWaveStarting;
    //   backgroundWaveEnding = widget.backgroundWaveEnding;
    // }
    color[0] = colorList[widget.colorStartIndex];
    color[1] = colorList[widget.colorStartIndex + 1];
    colorIndex = widget.colorStartIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(
          begin: backgroundWaveStarting,
          end: backgroundWaveEnding,
        ),
        duration: Duration(milliseconds: firstWaveTime),
        builder: (BuildContext context, double value, Widget? child) {
          return Stack(
            children: [
              Positioned(
                bottom: widget.topPosition,
                left: value,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: ClipPath(
                    clipper: MyCustomClipper(
                      height: 700,
                      amp: 400,
                      waveLength: widget.waveLength,
                      isAlternative: widget.isAlternate,
                    ),
                    child: Container(
                      height: 100 + 500,
                      width: MediaQuery.of(context).size.width,
                      //Colors.red,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: color),
                        //color: color,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        onEnd: () {
          setState(() {
            //   double temp = backgroundWaveStarting;
            // backgroundWaveStarting = backgroundWaveStarting2;
            // backgroundWaveStarting2 = temp;
            // temp = backgroundWaveEnding;
            // backgroundWaveEnding = backgroundWaveEnding2;
            // backgroundWaveEnding2 = temp;
            if (color[0] == Colors.transparent) {
              // if (widget.isAlternate) {
              backgroundWaveEnding = MediaQuery.of(context).size.width;
              // } else {
              //   backgroundWaveEnding = MediaQuery.of(context).size.width;
              // }
              color = tempColorSaver;
              firstWaveTime = widget.firstWaveTime * 1000;
              if (widget.isAlternate) {
                firstWaveTime = (firstWaveTime * 2);
              }
              colorIndex++;

              color[0] = colorList[colorIndex % colorList.length];
              color[1] = colorList[(colorIndex + 1) % colorList.length];
            } else {
              // backgroundWaveStarting = -1;
              //if (widget.isAlternate) {
              backgroundWaveEnding = -MediaQuery.of(context).size.width;
              // } else {
              //   backgroundWaveEnding = -MediaQuery.of(context).size.width;
              // }
              // backgroundWaveEnding = -(MediaQuery.of(context).size.width);
              firstWaveTime = 3;
              tempColorSaver = color;
              color = [Colors.transparent, Colors.transparent];
            }
          });
        },
      ),
    );
  }
}
