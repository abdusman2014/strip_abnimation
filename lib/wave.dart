import 'package:flutter/material.dart';
import 'package:live_gradient/wave_stack.dart';
import 'dart:math' as math;

class Wave extends StatefulWidget {
  Wave({Key? key}) : super(key: key);

  @override
  State<Wave> createState() => _WaveState();
}

class _WaveState extends State<Wave> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat(reverse: true);

  final colorList = [
    // [
    [Colors.teal, Colors.yellow],
    // ],
    // [
    [Colors.blue, Colors.red],
    //  ],
    // [
    [Colors.orange, Colors.yellow],

    /// ],
    // [
    [Colors.yellow, Colors.blue],
    // ],
    // [
    [Colors.black, Colors.purple],
    // ]
  ];

  // final colorList2 = [
  //   [
  //     [Colors.amber, Colors.blueGrey]
  //   ],
  //   [
  //     [Colors.cyanAccent, Colors.deepOrange]
  //   ],
  //   [
  //     [Colors.green, Colors.indigo]
  //   ],
  //   [
  //     [Colors.lime, Colors.orangeAccent]
  //   ],
  //   [
  //     [Colors.deepPurple, Colors.redAccent]
  //   ]
  // ];

  // final colorList3 = [
  //   [
  //     [Colors.teal, Colors.yellow]
  //   ],
  //   [
  //     [Colors.indigoAccent, Colors.red]
  //   ],
  //   [
  //     [Colors.orange, Colors.yellow]
  //   ],
  //   [
  //     [Colors.yellow, Colors.blue]
  //   ],
  //   [
  //     [Colors.black, Colors.purple]
  //   ]
  // ];

  // final colorList4 = [
  //   [
  //     [Colors.red, Colors.blue]
  //   ],
  //   [
  //     [Colors.blue, Colors.red]
  //   ],
  //   [
  //     [Colors.orange, Colors.yellow]
  //   ],
  //   [
  //     [Colors.yellow, Colors.blue]
  //   ],
  //   [
  //     [Colors.black, Colors.purple]
  //   ]
  // ];

  var waves = [
    [math.pi / 4, 0.34, 0.7, 2.4],
    [math.pi / 2 + 0.2, 0.4, 0.8, 2.4],
    [math.pi + 0.4, 0.4, 0.5, 2.4],
    [-0.4, 0.5, 0.5, 2.4]
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          final Size biggest = constraints.biggest;
          return AnimatedRotation(
            turns: 3,
            duration: Duration(seconds: 2),
            child: Stack(
              children: [
                // PositionedTransition(
                //   rect: RelativeRectTween(
                //   begin: RelativeRect.fromSize(
                //       const Rect.fromLTWH(0, 0, smallLogo, bigLogo),
                //       biggest),
                //   end: RelativeRect.fromSize(
                //       Rect.fromLTWH(
                //           0, 0, bigLogo, bigLogo),
                //       biggest),
                // ).animate(CurvedAnimation(
                //   parent: _controller,
                //   curve: Curves.linear,
                // )),
                // child:
                //Positioned(
                //  top: 10,
                //  left: 10,
                //child:
                WaveStack(
                  colorList: colorList,
                  biggest: biggest,
                  size: 800,
                  direction: 3,
                ),
                // ),
                //  ),
                WaveStack(
                  colorList: colorList,
                  biggest: biggest,
                  size: 10,
                  direction: 2,
                ),
                WaveStack(
                  colorList: colorList,
                  biggest: biggest,
                  size: 10,
                  direction: 1,
                ),
                WaveStack(
                  colorList: colorList,
                  biggest: biggest,
                  size: 800,
                  direction: 4,
                ),
              ],
            ),
          );
          // AnimatedContainer(
          //   color: Colors.blue[50],
          //   duration: const Duration(seconds: 2),
          //   height: size,
          //   width: size,
          //   curve: Curves.easeOutCirc,
          //   child: AnimatedOpacity(
          //     duration: const Duration(seconds: 2),
          //     opacity: opacity,
          //     child: Stack(
          //       children: waves.map((angle) {
          //         index++;
          //         return PositionedTransition(
          //           rect: RelativeRectTween(
          //             begin: RelativeRect.fromSize(
          //                 const Rect.fromLTWH(0, 0, smallLogo, smallLogo),
          //                 biggest),
          //             end: RelativeRect.fromSize(
          //                 Rect.fromLTWH(biggest.width - bigLogo,
          //                     biggest.height - bigLogo, bigLogo, bigLogo),
          //                 biggest),
          //           ).animate(CurvedAnimation(
          //             parent: _controller,
          //             curve: Curves.linear,
          //           )),
          //           child: Transform.rotate(
          //             angle: angle[0],
          //             child: Transform.scale(
          //               scale: angle[3],
          //               child: Opacity(
          //                 opacity: angle[2],
          //                 child: WaveWidget(
          //                   config: CustomConfig(
          //                     gradients: colorList[index],
          //                     durations: [
          //                       5500,
          //                     ],
          //                     heightPercentages: [
          //                       angle[1],
          //                     ],
          //                     blur:
          //                         const MaskFilter.blur(BlurStyle.normal, 1.3),
          //                     gradientBegin: Alignment.bottomCenter,
          //                     gradientEnd: Alignment.topRight,
          //                   ),
          //                   waveAmplitude: 0,
          //                   size: Size(
          //                     MediaQuery.of(context).size.height,
          //                     MediaQuery.of(context).size.height,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         );
          //       }).toList(),
          //     ),
          //   ),
          // );
        }),
      ),
    );
  }
}
