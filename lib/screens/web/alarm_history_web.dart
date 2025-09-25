import 'package:flutter/material.dart';
import 'package:upnext_mobile/widgets/web/alarm_tile_web.dart';
import 'package:upnext_mobile/widgets/web/custom_app_bar_web.dart';
import 'alarm_detail_web.dart';

class AlarmHistoryWebScreen extends StatefulWidget {
  const AlarmHistoryWebScreen({super.key});

  @override
  State<AlarmHistoryWebScreen> createState() => _AlarmHistoryWebScreenState();
}

class _AlarmHistoryWebScreenState extends State<AlarmHistoryWebScreen> {
  final List<Map<String, dynamic>> _alarms = [
    {
      "title": "Despertar",
      "time": "5:30 AM",
      "lista": "Trello",
      "sonido": "Breaking",
      "enabled": true
    },
    {
      "title": "Reunión",
      "time": "9:00 AM",
      "lista": "Asana",
      "sonido": "Standard",
      "enabled": true
    },
    {
      "title": "Antibiótico",
      "time": "7:30 PM",
      "lista": "Google Tasks",
      "sonido": "Beep",
      "enabled": false
    },
    {
      "title": "Clase de Yoga",
      "time": "6:00 PM",
      "lista": "Asana",
      "sonido": "Chill",
      "enabled": false
    },
  ];

  void _exportAlarms() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text("Funcionalidad de exportar no implementada")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final padding = width * 0.03;

    final activeAlarms = _alarms.where((a) => a["enabled"] == true).toList();
    final closedAlarms = _alarms.where((a) => a["enabled"] == false).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBarWeb(),
              SizedBox(height: height * 0.03),
              Padding(
                padding: EdgeInsets.only(left: width * 0.04),
                child: Text(
                  "Historial",
                  style: TextStyle(
                    fontSize: width * 0.035,
                    fontFamily: 'Rochester',
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),

              Padding(
                padding: EdgeInsets.only(left: width * 0.045),
                child: Text(
                  "Alarmas",
                  style: TextStyle(
                    fontSize: width * 0.018,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.04, bottom: height * 0.01),
                child: Divider(color: Colors.grey.shade300, thickness: 1),
              ),
              SizedBox(height: height * 0.02),

              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.04, bottom: height * 0.01),
                              child: Text(
                                "Activas",
                                style: TextStyle(
                                  fontSize: width * 0.015,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ...activeAlarms.map((alarm) {
                              int index = _alarms.indexOf(alarm);
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: height * 0.02,
                                    left: width * 0.04,
                                    right: width * 0.01),
                                child: AlarmTileWeb(
                                  title: alarm["title"],
                                  time: alarm["time"],
                                  value: alarm["enabled"],
                                  onChanged: (val) {
                                    setState(() {
                                      _alarms[index]["enabled"] = val;
                                    });
                                  },
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => AlarmDetailWebScreen(
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
                            }).toList(),
                          ],
                        ),
                      ),
                      SizedBox(width: width * 0.03),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.02, bottom: height * 0.01),
                              child: Text(
                                "Cerradas",
                                style: TextStyle(
                                  fontSize: width * 0.015,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ...closedAlarms.map((alarm) {
                              int index = _alarms.indexOf(alarm);
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: height * 0.02,
                                    left: width * 0.01,
                                    right: width * 0.02),
                                child: AlarmTileWeb(
                                  title: alarm["title"],
                                  time: alarm["time"],
                                  value: alarm["enabled"],
                                  onChanged: (val) {
                                    setState(() {
                                      _alarms[index]["enabled"] = val;
                                    });
                                  },
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => AlarmDetailWebScreen(
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
                            }).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                    right: width * 0.02,
                    top: height * 0.02,
                    bottom: height * 0.03),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: _exportAlarms,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE2CCD6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.01),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                        vertical: height * 0.015,
                      ),
                    ),
                    child: Text(
                      "Exportar",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: width * 0.015,
                      ),
                    ),
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
