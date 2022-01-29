import 'package:flutter/material.dart';
import 'package:live_gradient/backgroundWaveWidget.dart';

import 'front_wave_widget.dart';

class TransformTest extends StatelessWidget {
  const TransformTest({Key? key}) : super(key: key);

  final List<double> waveLengthList = const [
    50,
    100,
    150,
    200,
    250,
  ];

  final double backgroundWaveStarting = 0;

  @override
  Widget build(BuildContext context) {
    int waveLengthIndex = 0;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ...[],
            
            BackGroundWaveWidget(
              waveLength: waveLengthList[waveLengthIndex % waveLengthList.length],
              backgroundWaveStarting: backgroundWaveStarting,
              backgroundWaveEnding: MediaQuery.of(context).size.width,
              firstWaveTime: 6,
              topPosition: 00,
              colorStartIndex: 0,
              isAlternate: true,
            ),
            BackGroundWaveWidget(
              waveLength: waveLengthList[waveLengthIndex % waveLengthList.length],
              backgroundWaveStarting: -MediaQuery.of(context).size.width,
              backgroundWaveEnding: MediaQuery.of(context).size.width,
              firstWaveTime: 12,
              topPosition: 00,
              colorStartIndex: 0,
              isAlternate: false,
            ),
            BackGroundWaveWidget(
              waveLength: waveLengthList[waveLengthIndex % waveLengthList.length],
              backgroundWaveStarting: backgroundWaveStarting,
              backgroundWaveEnding: MediaQuery.of(context).size.width,
              firstWaveTime: 10,
              topPosition: 0,
              colorStartIndex: 2,
              isAlternate: true,
            ),
            BackGroundWaveWidget(
              waveLength: waveLengthList[waveLengthIndex % waveLengthList.length],
              backgroundWaveStarting: -MediaQuery.of(context).size.width,
              backgroundWaveEnding: MediaQuery.of(context).size.width,
              firstWaveTime: 20,
              topPosition: 0,
              colorStartIndex: 2,
              isAlternate: false,
            ),
            BackGroundWaveWidget(
              waveLength: waveLengthList[waveLengthIndex % waveLengthList.length],
              backgroundWaveStarting: backgroundWaveStarting,
              backgroundWaveEnding: MediaQuery.of(context).size.width,
              firstWaveTime: 12,
              topPosition: 0,
              colorStartIndex: 0,
              isAlternate: true,
            ),
            BackGroundWaveWidget(
              waveLength: waveLengthList[waveLengthIndex % waveLengthList.length],
              backgroundWaveStarting: -MediaQuery.of(context).size.width,
              backgroundWaveEnding: MediaQuery.of(context).size.width,
              firstWaveTime: 24,
              topPosition: 0,
              colorStartIndex: 4,
              isAlternate: false,
            ),
          //  const FrontWaveWidget(),
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  double height;
  double amp;
  final double waveLength;
  final bool isAlternative;

  MyCustomClipper(
      {required this.height,
      required this.amp,
      required this.waveLength,
      required this.isAlternative});

  @override
  Path getClip(Size size) {
    var path = Path();

    // double amp = 120;
    amp += waveLength;
    double xAxis = amp;

    height += (waveLength / 2);
    double midPoint = xAxis / 2;
    //path.lineTo(0, height);
    double additiveFactorHeight = waveLength / 10;
    double additiveFactorWidth = waveLength / 10;
    while (true) {
      if (xAxis > size.width) {
        // midPoint = (xAxis + size.width) / 2;
        // xAxis = size.width;
        path.quadraticBezierTo(
            midPoint,
            height - ((isAlternative) ? 0 : 20) + additiveFactorHeight,
            xAxis,
            10 + additiveFactorHeight);
        break;
      }
      path.quadraticBezierTo(
          midPoint,
          height - ((isAlternative) ? 0 : 20) + additiveFactorHeight,
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
          height - ((isAlternative) ? 20 : 0) + additiveFactorHeight,
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
