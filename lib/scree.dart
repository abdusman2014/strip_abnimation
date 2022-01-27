import 'dart:math';

import 'package:flutter/material.dart';

// class DemoPage extends StatefulWidget {
//   const DemoPage({Key? key}) : super(key: key);

//   @override
//   _DemoPageState createState() => _DemoPageState();

//   // DemoPage() {
//   //   //timeDilation = 1.0;
//   // }
// }

// class _DemoPageState extends State<DemoPage> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = Size(MediaQuery.of(context).size.width,
//         MediaQuery.of(context).size.height - 150);
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           DemoBody(size: size, xOffset: 0, yOffset: 0, color: Colors.red),
//           Opacity(
//             opacity: 0.9,
//             child: DemoBody(
//               size: size,
//               xOffset: 50,
//               yOffset: 10,
//               color: Colors.blue,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DemoBody extends StatefulWidget {
//   final Size size;
//   final int xOffset;
//   final int yOffset;
//   final Color? color;

//   const DemoBody(
//       {Key? key,
//       required this.size,
//       required this.xOffset,
//       required this.yOffset,
//       this.color})
//       : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return _DemoBodyState();
//   }
// }

// class _DemoBodyState extends State<DemoBody> with TickerProviderStateMixin {
//   late AnimationController animationController;
//   List<Offset> animList1 = [];

//   @override
//   void initState() {
//     super.initState();

//     animationController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 2));

//     animationController.addListener(() {
//       animList1.clear();
//       for (int i = -2 - widget.xOffset;
//           i <= widget.size.width.toInt() + 2;
//           i++) {
//         animList1.add(Offset(
//             i.toDouble() + widget.xOffset,
//             sin((animationController.value * 360 - i) % 360 * (pi / 180)) * 50 +
//                 300 +
//                 widget.yOffset));
//       }
//     });
//     animationController.repeat();
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Transform.rotate(
//       angle: 45,
//       child: Container(
//         alignment: Alignment.center,
//         child: Opacity(
//           opacity: 1,
//           child: AnimatedBuilder(
//             animation: CurvedAnimation(
//               parent: animationController,
//               curve: Curves.easeInOut,
//             ),
//             builder: (context, child) => ClipPath(
//               child: widget.color == null
//                   ? Container(
//                       width: widget.size.width,
//                       height: widget.size.height,
//                       color: Colors.yellow,
//                     )
//                   : Container(
//                       width: widget.size.width,
//                       height: widget.size.height,
//                       color: widget.color,
//                     ),
//               clipper: WaveClipper(animationController.value, animList1),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class WaveClipper extends CustomClipper<Path> {
//   final double animation;

//   List<Offset> waveList1 = [];

//   WaveClipper(this.animation, this.waveList1);

//   @override
//   Path getClip(Size size) {
//     Path path = Path();

//     path.addPolygon(waveList1, false);

//     path.lineTo(size.width, size.height);
//     path.lineTo(0.0, size.height);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(WaveClipper oldClipper) =>
//       animation != oldClipper.animation;
// }

class Screen extends StatefulWidget {
  const Screen({Key? key, }) : super(key: key);
  

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
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
  List<Color> colorList2 = [
    Colors.amber,
    Colors.black,
    Colors.pink,
    Colors.purple
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.topLeft,
  ];
  List<Alignment> alignmentList2 = [
    Alignment.topLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.bottomLeft,
  ];
  // List<Alignment> alignmenEndtList = [

  //   Alignment.topRight,
  //   Alignment.topLeft,
  //   Alignment.bottomLeft,
  //   Alignment.bottomRight,

  // ];
  int index = 0;
  int index2 = 0;
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;
  Color midColor = Colors.blue;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;
  Alignment begin2 = Alignment.topLeft;
  Alignment end2 = Alignment.bottomRight;
  bool alternate = false;
  int alignmentIndex = 0;
  int alignmentIndex2 = 0;
  late double height = 500;

  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                height: 500,
                width: MediaQuery.of(context).size.width,
                duration: const Duration(seconds: 5),
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
                    if (height == 0) {
                      height = MediaQuery.of(context).size.height;
                    } else {
                      height = 0;
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
              ),
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(seconds: 5),
                  onEnd: () {
                    setState(() {
                      index2 = index2 + 1;
                      // animate the color
                      bottomColor = colorList[index2 % colorList.length];
                      midColor = colorList[(index + 1) % colorList.length];
                      topColor = colorList[(index2 + 2) % colorList.length];
    
                      //// animate the alignment
                      //  if (alternate) {
                      //   begin = alignmentList[index % alignmentList.length];
                      //   end = alignmentList[(index + 2) % alignmentList.length];
                      // } else {
    
                      begin2 = alignmentList2[alignmentIndex2];
                      end2 = alignmentList2[
                          (alignmentIndex2 == alignmentList2.length - 1)
                              ? 0
                              : alignmentIndex2 + 1];
    
                      //}
                      alignmentIndex2++;
                      if (alignmentIndex2 >= alignmentList2.length) {
                        alignmentIndex2 = 0;
                      }
                      alternate = !alternate;
                    });
                  },
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          stops: const [
                            0.0,
                            0.4,
                            0.8,
                          ],
                          begin: begin2,
                          end: end2,
                          colors: [bottomColor, midColor, topColor])),
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: () {
                setState(() {
                  bottomColor = Colors.blue;
                  height = 0;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
