import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'dart:math' as math;

import 'package:wave/wave.dart';

class WaveStack extends StatefulWidget {
  const WaveStack(
      {Key? key,
      required this.colorList,
      required this.biggest,
      required this.size,
      required this.direction})
      : super(key: key);
  final List<List<Color>> colorList;
  final Size biggest;
  final double size;
  final int direction;

  @override
  State<WaveStack> createState() => _WaveStackState();
}

class _WaveStackState extends State<WaveStack> with TickerProviderStateMixin {
  var waves = [
    [math.pi / 4, 0.5, 0.7, 2.4],
    [math.pi / 2, 0.6, 0.8, 2.4],
    [math.pi + 0.4, 0.4, 0.5, 2.4],
    [-0.4, 0.5, 0.5, 2.4]
  ];

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat(reverse: true);

  bool changeHeight = false;
  late double siz = widget.size;
  late double opacity;
  bool changeColorAndSize = false;
  double turns = 1;
  late Animation<Offset> offset;
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.topLeft,
  ];
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;
  Color midColor = Colors.blue;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;
  int alignmentIndex = 0;
  int index = 0;
  List<Color> colorList = [
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
  @override
  void initState() {
    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.5, 0.5))
        .animate(_controller);
    // if (size == 800) {
    //   opacity = 1;
    // } else if (size <= 10) {
    //   opacity = 0.4;
    // }
    Timer(const Duration(seconds: 2), () {
      // if (size >= 400) {
      //   size = 10;
      //   opacity = 0.4;
      //   turns += 1;
      // } else {
      //   size = 800;
      //   opacity = 1;
      //   turns += 1;
      // }
      turns += 1;
      bottomColor = Colors.blue;
      setState(() {});
    });
    _controller.addStatusListener((status) {
      // if (size >= 800) {
      //   changeColorAndSize = false;
      // } else if (size <= 50) {
      //   changeColorAndSize = true;
      // }
      // if (changeColorAndSize) {
      //   size += 100;
      //   opacity += 0.15;
      // } else {
      //   size -= 100;
      //   opacity -= 0.15;
      // }
      Timer(const Duration(seconds: 2), () {
        turns += 1;
      bottomColor = Colors.blue;
        setState(() {});
      });

      if (waves[1][1] <= 0.4) {
        changeHeight = true;
      } else if (waves[1][1] >= 0.5) {
        changeHeight = false;
      }
      for (var element in waves) {
        if (changeHeight) {
          element[1] += 0.01;
        } else {
          element[1] -= 0.01;
        }
      }
     // bottomColor = bottomColor;
      setState(() {});
    });

    super.initState();
  }

  bool temp = false;
  @override
  Widget build(BuildContext context) {
    int index = -1;

    return AnimatedRotation(
      turns: turns,
      duration: Duration(seconds: 10),
      child: RotatedBox(
        quarterTurns: widget.direction,
        child: Stack(
          children: waves.map((angle) {
            // index++;
            return
                // AnimatedRotation(
                //   duration: Duration(seconds: 10),
                //   turns: turns,
                //   alignment: Alignment.bottomLeft,
                //curve: Curves.easeOutCirc,
                //  PositionedTransition(
                // rect: RelativeRectTween(
                //   begin: RelativeRect.fromSize(
                //       const Rect.fromLTWH(0, 0, smallLogo, smallLogo),
                //       widget.biggest),
                //   end: RelativeRect.fromSize(
                //       Rect.fromLTWH(
                //           0, widget.biggest.height - bigLogo, bigLogo, bigLogo),
                //       widget.biggest),
                // ).animate(CurvedAnimation(
                //   parent: _controller,
                //   curve: Curves.linear,
                // )),
                Transform.rotate(
              angle: angle[0],
              child: SlideTransition(
                position: offset,
                child: ClipPath(
                  clipper: MyCustomClipper(),
                  child: Opacity(
                    opacity: 0.5,
                    child: AnimatedContainer(
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

                          begin = alignmentList[alignmentIndex];
                          end = alignmentList[
                              (alignmentIndex == alignmentList.length - 1)
                                  ? 0
                                  : alignmentIndex + 1];

                          //}
                          alignmentIndex++;
                          if (alignmentIndex >= alignmentList.length) {
                            alignmentIndex = 0;
                          }
                        });
                      },
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              stops: const [
                                0.0,
                                0.4,
                                0.8,
                              ],
                              begin: begin,
                              end: end,
                              colors: [bottomColor, midColor, topColor])),
                      height: 500,
                      width: 500,
                      // decoration: BoxDecoration(
                      //     gradient:
                      //         LinearGradient(colors: widget.colorList[index])),
                    ),
                  ),
                ),
              ),
            );
            // );
          }).toList(),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    double amp = 100;
    double xAxis = amp;
    double midPoint = xAxis / 2;
    while (true) {
      if (xAxis > size.width) {
        midPoint = (xAxis + size.width) / 2;
        xAxis = size.width;
        path.quadraticBezierTo(midPoint, (size.height / 2), xAxis, 0);
        break;
      }
      path.quadraticBezierTo(midPoint, (size.height / 2), xAxis, 0);
      midPoint = (xAxis + (xAxis + amp)) / 2;
      xAxis += amp;

      path.quadraticBezierTo(midPoint, (size.height / 2), xAxis, 0);
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
// class MyCustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0.0, size.height - 20);

//     var firstControlPoint = Offset(size.width / 4, size.height);
//     var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);

//     var secondControlPoint =
//         Offset(size.width - (size.width / 3.25), size.height - 65);
//     var secondEndPoint = Offset(size.width, size.height - 40);
//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//         secondEndPoint.dx, secondEndPoint.dy);

//     path.lineTo(size.width, size.height - 40);
//     path.lineTo(size.width, 0.0);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

class CircleBlurPainter extends CustomPainter {
  CircleBlurPainter({required this.circleWidth, required this.blurSigma});

  double circleWidth;
  double blurSigma;

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = Colors.lightBlue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
