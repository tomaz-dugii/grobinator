import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class LightCandle extends StatefulWidget {
  final String candleId;
  static const valueKey = ValueKey('LightCandle');
  final ValueChanged<Map> didSelectedPage;

  const LightCandle({Key key, this.didSelectedPage, this.candleId})
      : super(key: key);

  @override
  _LightCandleState createState() => _LightCandleState();
}

class _LightCandleState extends State<LightCandle> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, size: 20.0),
        backgroundColor: Colors.white,
        title: Text("Sveča gori",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Spacer(),
                      SizedBox(
                        height: 100,
                      ),
                      new Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: new Image.asset(
                          "assets/images/candle.png",
                          fit: BoxFit.contain,
                          height: 200.0,
                          width: 200.0,
                        ),
                      ),
                      Text(
                        "Sveča prižgana",
                        style: TextStyle(fontSize: 24),
                      ),

                      SizedBox(
                        height: 100,
                      ),
                      SizedBox(height: 100),
                      Spacer()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
