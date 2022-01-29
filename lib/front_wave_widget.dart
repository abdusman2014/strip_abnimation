import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:live_gradient/test.dart';

class FrontWaveWidget extends StatefulWidget {
  const FrontWaveWidget({ Key? key }) : super(key: key);

  @override
  _FrontWaveWidgetState createState() => _FrontWaveWidgetState();
}

class _FrontWaveWidgetState extends State<FrontWaveWidget> {

  List<Color> colorList = [
    // Colors.red,
    Colors.pink[100]!,
    Colors.blue[200]!,
    Colors.green[300]!,
    Colors.purple[300]!,
    //Colors.deepPurple,
    // Colors.redAccent,
    // Colors.lime,
    // Colors.orangeAccent,
    // Colors.indigo,
    // Colors.cyanAccent,
    // Colors.deepOrange,
    // Colors.amber,
    // Colors.blueGrey,
  ];
  int ColorIndex = 0;

  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.topLeft,
    Alignment.bottomCenter,
    Alignment.topCenter,
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
  ];

  Alignment colorBegin = Alignment.bottomLeft;
  Alignment colorEnd = Alignment.topRight;

  int alignmentIndex = 0;
  double begin = 100;
  double end = 50;
  
  List<double> waveLengthList = [
    50,
    100,
    150,
    200,
    250,
  ];
  int waveLengthIndex = 0;

 

  

  double opacityValue = 1;

  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 110), (timer) {
      opacityValue -= 0.01;
    });
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: begin,
              end: end,
            ),
            duration: const Duration(seconds: 10),
            builder: (BuildContext context, double value, Widget? child) {
              return ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Align(
                  alignment:
                      alignmentList[alignmentIndex % alignmentList.length],
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: ClipPath(
                      clipper: MyCustomClipper(
                          height: value,
                          amp: value,
                          waveLength: waveLengthList[
                              waveLengthIndex % waveLengthList.length], isAlternative: false),
                      child: Opacity(
                        opacity: opacityValue,
                        child: Container(
                          height: value + 100,
                          width: 800,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: colorList[ColorIndex % colorList.length],
                                blurRadius: 10,
                                offset: const Offset(4, 6),
                              ),
                              BoxShadow(
                                color: colorList[ColorIndex % colorList.length],
                                blurRadius: 10,
                                offset: const Offset(-4, -6),
                              ),
                            ],
                            color: colorList[ColorIndex % colorList.length],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            onEnd: () {
              setState(() {
                if (begin == 100) {
                  begin = 50;
                  end = 100;
                } else {
                  begin = 100;
                  end = 50;
                }
                alignmentIndex++;
                opacityValue = 1;
                ColorIndex++;

                waveLengthIndex++;
               
              });
            },
          );
  }
}