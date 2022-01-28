import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:live_gradient/backgroundWaveWidget.dart';

class TransformTest extends StatefulWidget {
  const TransformTest({Key? key}) : super(key: key);

  @override
  State<TransformTest> createState() => _TransformTestState();
}

class _TransformTestState extends State<TransformTest>
    with TickerProviderStateMixin {
  // late Animation<Offset> offset;
  // late final AnimationController _controller = AnimationController(
  //   duration: const Duration(seconds: 5),
  //   vsync: this,
  // )..repeat(reverse: true);
  // double startingX = 0, startingY = 1;
  // double endingX = 2, endingY = 0;
  // @override
  // void initState() {
  //   offset = Tween<Offset>(
  //           begin: Offset(startingX, startingY), end: Offset(endingX, endingY))
  //       .animate(_controller);
  //   _controller.addStatusListener((status) {
  //     // if (status == AnimationStatus.completed) {
  //     startingX = 1;
  //     startingY = 0;
  //     endingX = 0;
  //     endingY = 1;
  //     setState(() {
  //       // offset = Tween<Offset>(
  //       //         begin: Offset(startingX, startingY),
  //       //         end: Offset(endingX, endingY))
  //       //     .animate(_controller);
  //     });
  //     // }
  //   });
  //   super.initState();
  // }

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
  List<double> angleList = [
    // 45,
    //  180,
    // 90,
    // 270,
    // 360,
  ];
  int angleIndex = 0;
  List<double> waveLengthList = [
    50,
    100,
    150,
    200,
    250,
  ];
  int waveLengthIndex = 0;

  int index = 0;
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;
  Color midColor = Colors.blue;
  double animatedColorXAxis = 0;
  double animatedColorYAxis = 0;

  double backgroundColorBegin = 300;
  double backgroundColorEnd = 100;

  double animatedHeight = 100;

  double opacityValue = 1;

  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 110), (timer) {
      opacityValue -= 0.01;
    });
    // setState(() {
    //   backgroundWaveStarting = 500;
    // });
    super.initState();
  }

  double backgroundWaveStarting = 0;
  double backgroundWaveEnding = 400;
  double backgroundWaveStarting2 = -400;
  double backgroundWaveEnding2 = 0;
  int firstWaveTime = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundWaveWidget(
            waveLength: waveLengthList[waveLengthIndex % waveLengthList.length],
          //  color: [colorList[ColorIndex % colorList.length],colorList[(ColorIndex+1) % colorList.length]],
            backgroundWaveStarting: backgroundWaveStarting,
            backgroundWaveEnding: MediaQuery.of(context).size.width,
            firstWaveTime: 3,
            topPosition: 00,
            colorStartIndex: 0,
          ),
          BackGroundWaveWidget(
            waveLength: waveLengthList[waveLengthIndex % waveLengthList.length],
           // color: [colorList[ColorIndex % colorList.length],colorList[(ColorIndex+1) % colorList.length]],
            backgroundWaveStarting: -MediaQuery.of(context).size.width,
            backgroundWaveEnding: MediaQuery.of(context).size.width,
            topPosition: 00,
            colorStartIndex: 0,
          ),
          BackGroundWaveWidget(
            waveLength: waveLengthList[waveLengthIndex % waveLengthList.length],
           // color: [colorList[ColorIndex % colorList.length],colorList[(ColorIndex+1) % colorList.length]],
            backgroundWaveStarting: backgroundWaveStarting,
            backgroundWaveEnding: MediaQuery.of(context).size.width,
            firstWaveTime: 3,
            topPosition: 50,
            colorStartIndex: 2,
          ),
          BackGroundWaveWidget(
            waveLength: waveLengthList[waveLengthIndex % waveLengthList.length],
           // color: [colorList[ColorIndex % colorList.length],colorList[(ColorIndex+1) % colorList.length]],
            backgroundWaveStarting: -MediaQuery.of(context).size.width,
            backgroundWaveEnding: MediaQuery.of(context).size.width,
            topPosition: 50,
            colorStartIndex: 2,
          ),
          
          
          // TweenAnimationBuilder<double>(
          //   tween: Tween<double>(
          //     begin: backgroundWaveStarting,
          //     end: backgroundWaveEnding,
          //   ),
          //   duration: Duration(seconds: firstWaveTime),
          //   builder: (BuildContext context, double value, Widget? child) {
          //     return Stack(
          //       children: [
          //         Positioned(
          //           left: value,
          //           child: RotatedBox(
          //             quarterTurns: 2,
          //             child: ClipPath(
          //               clipper: MyCustomClipper(
          //                   height: 100,
          //                   amp: 100,
          //                   waveLength: waveLengthList[
          //                       waveLengthIndex % waveLengthList.length]),
          //               child: Container(
          //                 height: 100 + 100,
          //                 width: 400,
          //                 //Colors.red,
          //                 decoration: BoxDecoration(
          //                   color: colorList[ColorIndex % colorList.length],
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          //   onEnd: () {
          //     setState(() {
          //       //   double temp = backgroundWaveStarting;
          //       // backgroundWaveStarting = backgroundWaveStarting2;
          //       // backgroundWaveStarting2 = temp;
          //       // temp = backgroundWaveEnding;
          //       // backgroundWaveEnding = backgroundWaveEnding2;
          //       // backgroundWaveEnding2 = temp;
          //       backgroundWaveStarting = 0;
          //       firstWaveTime = 6;
          //     });
          //   },
          // ),
          // TweenAnimationBuilder<double>(
          //   tween: Tween<double>(
          //     begin: backgroundWaveStarting2,
          //     end: backgroundWaveEnding,
          //   ),
          //   duration: const Duration(seconds: 6),
          //   builder: (BuildContext context, double value, Widget? child) {
          //     return Stack(
          //       children: [
          //         Positioned(
          //           left: value,
          //           child: RotatedBox(
          //             quarterTurns: 2,
          //             child: ClipPath(
          //               clipper: MyCustomClipper(
          //                   height: 100,
          //                   amp: 100,
          //                   waveLength: waveLengthList[
          //                       waveLengthIndex % waveLengthList.length]),
          //               child: Container(
          //                 height: 100 + 100,
          //                 width: 400,
          //                 //Colors.red,
          //                 decoration: BoxDecoration(
          //                   color: colorList[ColorIndex % colorList.length],
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          //   onEnd: () {
          //     setState(() {
          //       //   double temp = backgroundWaveStarting;
          //       // backgroundWaveStarting = backgroundWaveStarting2;
          //       // backgroundWaveStarting2 = temp;
          //       // temp = backgroundWaveEnding;
          //       // backgroundWaveEnding = backgroundWaveEnding2;
          //       // backgroundWaveEnding2 = temp;
          //       backgroundWaveStarting2 = 0;
          //     });
          //   },
          // ),
          TweenAnimationBuilder<double>(
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
                    //angle: 0,//angleList[angleIndex % angleList.length],
                    child: ClipPath(
                      clipper: MyCustomClipper(
                          height: value,
                          amp: value,
                          waveLength: waveLengthList[
                              waveLengthIndex % waveLengthList.length]),
                      child: Opacity(
                        opacity: opacityValue,
                        child: Container(
                          height: value + 100,
                          width: 800,
                          //Colors.red,
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
                angleIndex++;

                ColorIndex++;
                midColor = Colors.black;

                index = index + 1;

                waveLengthIndex++;
                // backgroundWaveStarting = 500;
                // if (backgroundColorBegin == 300) {
                //   backgroundColorBegin = 100;
                //   backgroundColorEnd = 300;
                // } else {
                //   backgroundColorBegin = 300;
                //   backgroundColorEnd = 100;
                // }
                if (animatedHeight == 100) {
                  animatedHeight = 10;
                } else {
                  animatedHeight = 100;
                }
                Random random = Random();
                int randomNumber =
                    random.nextInt(MediaQuery.of(context).size.width.round());
                animatedColorXAxis = randomNumber * 1.0;
                randomNumber =
                    random.nextInt(MediaQuery.of(context).size.height.round());
                animatedColorYAxis = randomNumber * 1.0;
              });
            },
          )
        ],
      ),
    );
  }

  Opacity buildBackGroundColors() {
    return Opacity(
      opacity: 0.8,
      //  borderRadius: BorderRadius.circular(100),
      child: Column(
        children: [
          buildAnimatedWidget(animatedHeight),
          Expanded(child: buildAnimatedWidget(animatedHeight)),
          // Expanded(child: Container()),
          buildAnimatedWidget(animatedHeight),
          Expanded(child: buildAnimatedWidget(animatedHeight)),
          // Expanded(child: Container()),
          buildAnimatedWidget(animatedHeight),
          Expanded(child: buildAnimatedWidget(animatedHeight)),
          // Expanded(child: Container()),
          buildAnimatedWidget(animatedHeight),
          //  Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget buildAnimatedWidget(double height) {
    return AnimatedContainer(
      height: height,
      width: MediaQuery.of(context).size.width,
      duration: const Duration(seconds: 5),
      decoration: BoxDecoration(
          //shape: BoxShape.circle,
          gradient: LinearGradient(
              stops: const [0.0, 0.2, 0.4, 0.6, 0.8],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colorList[(index + 0) % colorList.length],
                colorList[(index + 1) % colorList.length],
                colorList[(index + 2) % colorList.length],
                colorList[(index + 3) % colorList.length],
                colorList[(index + 4) % colorList.length],
              ])),
    );
    // TweenAnimationBuilder<double>(
    //   tween: Tween<double>(
    //     begin: backgroundColorBegin,
    //     end: backgroundColorEnd,
    //   ),
    //   duration: const Duration(seconds: 3),
    //   builder: (BuildContext context, double value, Widget? child) {
    //     return ClipPath(
    //       clipper: MyCustomClipper(height: value, amp: value, waveLength: 5),
    //       child: AnimatedContainer(
    //         height: value + 100,
    //         width: MediaQuery.of(context).size.width,
    //         duration: const Duration(seconds: 5),
    //         decoration: BoxDecoration(
    //             //shape: BoxShape.circle,
    //             gradient: LinearGradient(
    //                 stops: const [0.0, 0.2, 0.4, 0.6, 0.8],
    //                 begin: Alignment.topCenter,
    //                 end: Alignment.bottomCenter,
    //                 colors: [
    //                   colorList[(index + 0) % colorList.length],
    //                   colorList[(index + 1) % colorList.length],
    //                   colorList[(index + 2) % colorList.length],
    //                   colorList[(index + 3) % colorList.length],
    //                   colorList[(index + 4) % colorList.length],
    //                 ])),
    //       ),
    //     );
    //   },
    //   onEnd: () {
    //     setState(() {
    //        if (backgroundColorBegin == 100) {
    //              backgroundColorBegin = 50;
    //               backgroundColorEnd = 100;
    //             } else {
    //               backgroundColorBegin = 100;
    //               backgroundColorEnd = 50;
    //             }
    //     });
    //   },
    // );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  double height;
  double amp;
  final double waveLength;

  MyCustomClipper(
      {required this.height, required this.amp, required this.waveLength});
  // @override
  // Path getClip(Size size) {
  //   var path = Path();
  //   path.lineTo(0, size.height);
  //   var x = 0.0;
  //   var numberOfWaves = 3;
  //   var increment = size.width / numberOfWaves;
  //   bool startFromTop = false;
  //   double waveHeight = 20;
  //   while (x < size.width) {
  //     if (startFromTop) {
  //       path.lineTo(x, 0);
  //       path.cubicTo(x + increment / 2, 0, x + increment / 2, size.height,
  //           x + increment, size.height);
  //     } else {
  //       //  path.lineTo(x, size.height-20);
  //       path.cubicTo(x + increment / 2, size.height - waveHeight,
  //           x + increment / 2, 0, x + increment, 0);
  //       if (waveHeight == 20) {
  //         waveHeight = 5;
  //       } else {
  //         waveHeight = 20;
  //       }
  //     }
  //     x += increment;
  //     startFromTop = !startFromTop;
  //   }

  //   path.lineTo(size.width, 0);
  //   path.lineTo(0, 0);
  //   path.close();

  //   return path;
  // }
  @override
  Path getClip(Size size) {
    var path = Path();

    // double amp = 120;
    amp += waveLength;
    double xAxis = amp;
    height += (waveLength / 2);
    double midPoint = xAxis / 2;
    // path.lineTo(0, size.height-20);
    double additiveFactorHeight = waveLength / 10;
    double additiveFactorWidth = waveLength / 10;
    while (true) {
      if (xAxis > size.width) {
        // midPoint = (xAxis + size.width) / 2;
        // xAxis = size.width;
        path.quadraticBezierTo(midPoint, height - 20 + additiveFactorHeight,
            xAxis, 10 + additiveFactorHeight);
        break;
      }
      path.quadraticBezierTo(
          midPoint,
          height - 20 + additiveFactorHeight,
          additiveFactorWidth + (xAxis + midPoint) / 2,
          20 + additiveFactorHeight);
      path.quadraticBezierTo(
          xAxis,
          -20 + additiveFactorHeight,
          (xAxis - ((xAxis + midPoint) / 2)) + xAxis - additiveFactorWidth,
          20 + additiveFactorHeight);
      midPoint = (xAxis + (xAxis + amp)) / 2;
      xAxis += amp;

      path.quadraticBezierTo(
          midPoint,
          height + additiveFactorHeight,
          additiveFactorWidth + (xAxis + midPoint) / 2,
          20 + additiveFactorHeight);
      path.quadraticBezierTo(
          xAxis,
          -20 + additiveFactorHeight,
          (xAxis - ((xAxis + midPoint) / 2)) + xAxis - additiveFactorWidth,
          20 + additiveFactorHeight);

      midPoint = (xAxis + (xAxis + amp)) / 2;
      xAxis += amp;
    }

    path.lineTo(size.width, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
