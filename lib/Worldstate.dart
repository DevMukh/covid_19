import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldState extends StatefulWidget {
  const WorldState({Key? key}) : super(key: key);

  @override
  State<WorldState> createState() => _WorldStateState();
}

class _WorldStateState extends State<WorldState> with TickerProviderStateMixin {
  @override
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 5),
    vsync: this,
  )..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorl = <Color>[
    const Color(0xFF546E7A),
    const Color(0xFF00838F),
    const Color(0xFF7CB342),
  ];
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          PieChart(
            dataMap: {"total": 3400, "Death": 2000, "Recover": 2000},
            chartRadius: 1040,
            chartType: ChartType.disc,
            colorList: colorl,
            legendOptions: LegendOptions(
              legendTextStyle: GoogleFonts.aladin(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white),
              legendPosition: LegendPosition.left,
              legendShape: BoxShape.circle,
            ),
            chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: true,
                showChartValuesInPercentage: false),
            animationDuration: Duration(seconds: 6),
            //here animation duration means how it will takes time to complete time to cover its circle
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical:40),
            child: Card(
              color: Colors.pink,
              child: Column(
                children: [
                  Resuable(title: 'Total cases', value: '3200'),
                  Resuable(title: 'Total recovery', value: '1320'),
                  Resuable(title: 'Total death', value: '1880'),
                  Divider(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              //color: Colors.cyanAccent,
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Go track',
                  style: GoogleFonts.aladin(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class Resuable extends StatelessWidget {
  String title;
  String value;
  Resuable({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.aladin(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15),
              ),
              Text(
                value,
                style: GoogleFonts.aladin(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}
