import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final ValueChanged<Map> didSelectedPage;

  const HomePage({Key key,  this.didSelectedPage}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
     Map _selectedPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, size: 20.0),
        backgroundColor: Colors.white,
        title:Text("Grobinator", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
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
                          children: [
                            Spacer(),
                            SizedBox(
                              height: 100,
                            ),
                            
                            Text(
                              "Dobrodošli v Grobinatorju",
                              style: TextStyle(fontSize: 24),
                            ),
                            
                            SizedBox(
                              height: 100,
                            ),
                            ElevatedButton(
                              onPressed: () => widget.didSelectedPage({
                                'page': 'LightCandle',
                              }),
                              child: Text("Prižgi svečo",style: TextStyle(fontSize: 20),),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF002A69),
                                onPrimary: Colors.white,
                                minimumSize: Size(300, 60),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              /*onPressed: () => widget.didSelectedPage({
                                'page': 'qrScan',
                              }),*/
                              onPressed: () => widget.didSelectedPage({
                                'page': 'GravePage',
                              }),
                              child: Text("Poišči grob",
                              style: TextStyle(fontSize: 20),),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF002A69),
                                onPrimary: Colors.white,
                                minimumSize: Size(300, 60),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              ),
                            ),
                            SizedBox(height:100),
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