import 'package:flutter/material.dart';

class TransformTest extends StatefulWidget {
  const TransformTest({Key? key}) : super(key: key);

  @override
  State<TransformTest> createState() => _TransformTestState();
}

class _TransformTestState extends State<TransformTest>
    with TickerProviderStateMixin {
  late Animation<Offset> offset;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: true);
  double startingX = 0, startingY = 1;
  double endingX = 2, endingY = 0;
  @override
  void initState() {
    offset = Tween<Offset>(
            begin: Offset(startingX, startingY), end: Offset(endingX, endingY))
        .animate(_controller);
    _controller.addStatusListener((status) {
      // if (status == AnimationStatus.completed) {
      startingX = 1;
      startingY = 0;
      endingX = 0;
      endingY = 1;
      setState(() {
        // offset = Tween<Offset>(
        //         begin: Offset(startingX, startingY),
        //         end: Offset(endingX, endingY))
        //     .animate(_controller);
      });
      // }
    });
    super.initState();
  }

  double begin = 100;
  double end = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RotatedBox(
          quarterTurns: 2,
          child: Stack(
            children: [
              Container(
                height: 200,
                width: 300,
                color: Colors.blue,
              ),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(
                  begin: begin,
                  end: end,
                ),
                duration: const Duration(seconds: 2),
                builder: (BuildContext context, double value, Widget? child) {
                  return ClipPath(
                    clipper: MyCustomClipper(value, value + 50),
                    child: Container(
                      height: value,
                      width: 300,
                      color: Colors.red,
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
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  final double height;
  final double amp;

  MyCustomClipper(this.height, this.amp);

  @override
  Path getClip(Size size) {
    var path = Path();

    // double amp = 120;
    double xAxis = amp;
    double midPoint = xAxis / 2;
    while (true) {
      if (xAxis > size.width) {
        midPoint = (xAxis + size.width) / 2;
        xAxis = size.width;
        path.quadraticBezierTo(midPoint, height - 30, xAxis, 0);
        break;
      }
      path.quadraticBezierTo(midPoint, height - 30, xAxis, 0);
      midPoint = (xAxis + (xAxis + amp)) / 2;
      xAxis += amp;

      path.quadraticBezierTo(midPoint, height, xAxis, 0);
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
