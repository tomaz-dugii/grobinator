import 'package:flutter/material.dart';

class GravePage extends StatelessWidget {
    static const valueKey = ValueKey('GravePage');
  final ValueChanged<Map> didSelectedPage;

  const GravePage({Key key, this.didSelectedPage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, size: 20.0),
        backgroundColor: Colors.white,
        title:Text("Iskanje groba", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
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
                              "Poišči grob",
                              style: TextStyle(fontSize: 24),
                            ),
                            
                            SizedBox(
                              height: 100,
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