import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'Worldstate.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen>
    with TickerProviderStateMixin {
  /*
  stateful widject is created so init state is used to enter a new program
   */
  late final AnimationController _controller = AnimationController(
    duration: Duration(
        seconds: 3),
      vsync: this,
  )..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => WorldState())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                child: Container(
                  height: 300,
                  width: 300,
                  child: Center(
                    child: Image(
                      image: AssetImage('images/virus.png'),
                    ),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  /*
             JIs widget ko rotate krna hoga esi ko yahan transform kreyn gy
              */
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: child,
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Covid_19\nMy app',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aladin(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
