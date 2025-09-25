import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:upnext_mobile/screens/mobile/home_mobile.dart';
import 'package:upnext_mobile/screens/web/home_web.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const HomeWeb();
    } else {
      return const HomeMobile();
    }
  }
}