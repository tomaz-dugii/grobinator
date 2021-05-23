import 'package:flutter/material.dart';

class CandleListPage extends StatelessWidget {
  static const valueKey = ValueKey('CandleList');
  final ValueChanged<Map> didSelectedPage;

  const CandleListPage({Key key, this.didSelectedPage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, size: 20.0),
        backgroundColor: Colors.white,
        title: Text("Seznam sveč",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
        centerTitle: true,
        elevation: 0,
        actions: [
          InkWell(
            child: Icon(
              Icons.qr_code_scanner_rounded,
              color: Colors.black,
              size: 40.0,
            ),
            onTap: () => didSelectedPage({
              'page': 'qrScan',
            }),
          ),
          SizedBox(width: 10),
        ],
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
                    children: [
                       SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Izberi željeno svečo in jo prižgi v spomin pokojnega.",
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 18),
                      Card(
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                didSelectedPage({
                                  'page': 'LightCandle',
                                  'candleID': "54321",
                                });
                              },
                              leading: Icon(
                                Icons.lightbulb_outline_rounded,
                                color: Colors.black,
                                size: 40.0,
                              ),
                              title: Text(
                                "Sveča 1",
                                style: TextStyle(fontSize: 22),
                              ),
                              subtitle: Text(
                                "ID Sveče: 54321",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                didSelectedPage({
                                  'page': 'LightCandle',
                                  'candleID': "12345",
                                });
                              },
                              leading: Icon(
                                Icons.lightbulb_outline_rounded,
                                color: Colors.black,
                                size: 40.0,
                              ),
                              title: Text(
                                "Sveča 2",
                                style: TextStyle(fontSize: 22),
                              ),
                              subtitle: Text(
                                "ID Sveče: 12345",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                didSelectedPage({
                                  'page': 'LightCandle',
                                  'candleID': "41343",
                                });
                              },
                              leading: Icon(
                                Icons.lightbulb_outline_rounded,
                                color: Colors.black,
                                size: 40.0,
                              ),
                              title: Text(
                                "Sveča 3",
                                style: TextStyle(fontSize: 22),
                              ),
                              subtitle: Text(
                                "ID Sveče: 41343",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
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
