import 'package:flutter/material.dart';
import 'package:live_gradient/test.dart';

class BackGroundWaveWidget extends StatefulWidget {
  const BackGroundWaveWidget(
      {Key? key,
      required this.waveLength,
      //required this.color,
      this.firstWaveTime = 6,
      required this.backgroundWaveStarting,
      required this.backgroundWaveEnding,
      required this.colorStartIndex,
      required this.topPosition})
      : super(key: key);
  final double waveLength;
  //final List<Color> color;
  final int firstWaveTime;
  final double backgroundWaveStarting;
  final double backgroundWaveEnding;
  final double topPosition;
  final int colorStartIndex;

  @override
  State<BackGroundWaveWidget> createState() => _BackGroundWaveWidgetState();
}

class _BackGroundWaveWidgetState extends State<BackGroundWaveWidget> {
  late int firstWaveTime = widget.firstWaveTime * 1000;
  late double backgroundWaveStarting = widget.backgroundWaveStarting;
  late List<Color> color = [Colors.green[300]!, Colors.purple[300]!];
  late double backgroundWaveEnding = widget.backgroundWaveEnding;
  late List<Color> tempColorSaver;

  List<Color> colorList = [
    // Colors.red,
    Colors.pink[100]!,
    Colors.blue[200]!,
    Colors.green[300]!,
    Colors.purple[300]!,
  ];
  int colorIndex = 0;
  @override
  void initState() {
    color[0] = colorList[widget.colorStartIndex];
    color[1] = colorList[widget.colorStartIndex + 1];
    colorIndex = widget.colorStartIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        begin: backgroundWaveStarting,
        end: backgroundWaveEnding,
      ),
      duration: Duration(milliseconds: firstWaveTime),
      builder: (BuildContext context, double value, Widget? child) {
        return Stack(
          children: [
            Positioned(
              top: widget.topPosition,
              left: value,
              child: RotatedBox(
                quarterTurns: 2,
                child: ClipPath(
                  clipper: MyCustomClipper(
                    height: 100,
                    amp: 100,
                    waveLength: widget.waveLength,
                  ),
                  child: Container(
                    height: 100 + 100,
                    width: 400,
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
            backgroundWaveEnding = MediaQuery.of(context).size.width;
            color = tempColorSaver;
            firstWaveTime = 6 * 1000;
            colorIndex++;

            color[0] = colorList[colorIndex % colorList.length];
            color[1] = colorList[(colorIndex + 1) % colorList.length];
          } else {
            backgroundWaveStarting = -1;
            backgroundWaveEnding = -(MediaQuery.of(context).size.width);
            firstWaveTime = 3;
            tempColorSaver = color;
            color = [Colors.transparent, Colors.transparent];
          }
        });
      },
    );
  }
}
