import 'package:flutter/material.dart';
import 'package:upnext_mobile/widgets/mobile/alarm_tile_mobile.dart';
import 'package:upnext_mobile/widgets/mobile/custom_app_bar_mobile.dart';
import 'alarm_detail_mobile.dart';

class AlarmHistoryMobileScreen extends StatefulWidget {
  const AlarmHistoryMobileScreen({super.key});

  @override
  State<AlarmHistoryMobileScreen> createState() =>
      _AlarmHistoryMobileScreenState();
}

class _AlarmHistoryMobileScreenState extends State<AlarmHistoryMobileScreen> {
  final List<Map<String, dynamic>> _activeAlarms = [
    {
      "title": "Despertar",
      "time": "5:30 AM",
      "lista": "Trello",
      "sonido": "Breaking",
      "enabled": true,
    },
    {
      "title": "Reunión",
      "time": "9:00 AM",
      "lista": "Asana",
      "sonido": "Standard",
      "enabled": true,
    },
  ];

  final List<Map<String, dynamic>> _closedAlarms = [
    {
      "title": "Antibiótico",
      "time": "7:30 PM",
      "lista": "Google Tasks",
      "sonido": "Beep",
      "enabled": false,
    },
    {
      "title": "Clase de Yoga",
      "time": "6:00 PM",
      "lista": "Asana",
      "sonido": "Chill",
      "enabled": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;
    final double padding = screenHeight * 0.02;
    final double titleFontSize = screenHeight * 0.045;
    final double sectionFontSize = screenHeight * 0.02;
    final double tileSpacing = screenHeight * 0.02;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: ListView(
              children: [
                SizedBox(
                  height: screenHeight * 0.07,
                  child: const CustomAppBarMobile(),
                ),
                SizedBox(height: padding),

                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.05),
                  child: Text(
                    "Historial",
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontFamily: 'Rochester',
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.055),
                  child: Text(
                    "Alarmas",
                    style: TextStyle(
                      fontSize: sectionFontSize,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: tileSpacing / 2),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04),
                  child: Divider(color: Colors.grey.shade300),
                ),
                SizedBox(height: tileSpacing),

                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05, bottom: tileSpacing / 2),
                  child: Text(
                    "Activas",
                    style: TextStyle(
                      fontSize: sectionFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ..._activeAlarms.asMap().entries.map((entry) {
                  int index = entry.key;
                  var alarm = entry.value;

                  return Padding(
                    padding: EdgeInsets.only(bottom: tileSpacing),
                    child: AlarmTileMobile(
                      title: alarm["title"],
                      time: alarm["time"],
                      value: alarm["enabled"],
                      onChanged: (val) {
                        setState(() {
                          _activeAlarms[index]["enabled"] = val;
                        });
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AlarmDetailMobileScreen(
                              nombre: alarm["title"],
                              hora: alarm["time"],
                              lista: alarm["lista"],
                              sonido: alarm["sonido"],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),

                SizedBox(height: tileSpacing * 1.5),

                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05, bottom: tileSpacing / 2),
                  child: Text(
                    "Cerradas",
                    style: TextStyle(
                      fontSize: sectionFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ..._closedAlarms.asMap().entries.map((entry) {
                  int index = entry.key;
                  var alarm = entry.value;

                  return Padding(
                    padding: EdgeInsets.only(bottom: tileSpacing),
                    child: AlarmTileMobile(
                      title: alarm["title"],
                      time: alarm["time"],
                      value: alarm["enabled"],
                      onChanged: (val) {
                        setState(() {
                          _closedAlarms[index]["enabled"] = val;
                        });
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AlarmDetailMobileScreen(
                              nombre: alarm["title"],
                              hora: alarm["time"],
                              lista: alarm["lista"],
                              sonido: alarm["sonido"],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}