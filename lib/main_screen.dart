import 'package:flutter/material.dart';
import 'package:grobinator/pages/light_candle.dart';

import 'home_page.dart';
import 'pages/qr_scan.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  _MainScreenState();
  @override
  void initState() {
    super.initState();
  }
   Map _selectedPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        pages: [
          MaterialPage(
            child: HomePage(
              didSelectedPage: (page) => setState(() => _selectedPage = page),
            ),
            key: ValueKey('home'),
          ),
          if (_selectedPage != null && _selectedPage['page'] == 'qrScan')
            MaterialPage(
                child: QrCodeScann(
                  didSelectedPage: (page) => setState(() => _selectedPage = page),
                ),
                key: ValueKey('qrScan')),
          if (_selectedPage != null && _selectedPage['page'] == 'LightCandle')
            MaterialPage(
              child: LightCandle(
                didSelectedPage: (page) => setState(() => _selectedPage = page),
              ),
              key: ValueKey('LightCandle'),
            ),
          if (_selectedPage != null && _selectedPage['page'] == 'GravePage')
            MaterialPage(
              child: LightCandle(
                didSelectedPage: (page) => setState(() => _selectedPage = page),
              ),
              key: ValueKey('GravePage'),
            ),
        ],
        onPopPage: (route, result) {
          final page = route.settings as MaterialPage;
          if (page.key == QrCodeScann.valueKey) _selectedPage = null;
          if (page.key == QrCodeScann.valueKey) _selectedPage = null;
          if (page.key == LightCandle.valueKey) {
            _selectedPage['page'] = null;
          }
          return route.didPop(result);
        },
      ),
    );
  }
}