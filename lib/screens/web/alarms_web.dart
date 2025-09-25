import 'package:flutter/material.dart';
import 'package:upnext_mobile/screens/web/add_alarm_web.dart';
import 'package:upnext_mobile/screens/web/alarm_detail_web.dart';
import 'package:upnext_mobile/screens/web/alarm_history_web.dart';
import 'package:upnext_mobile/widgets/web/alarm_tile_web.dart';
import 'package:upnext_mobile/widgets/web/custom_app_bar_web.dart';

class AlarmsWebScreen extends StatefulWidget {
  const AlarmsWebScreen({super.key});

  @override
  State<AlarmsWebScreen> createState() => _AlarmsWebScreenState();
}

class _AlarmsWebScreenState extends State<AlarmsWebScreen> {
  final List<Map<String, dynamic>> _alarms = [
    {
      "title": "Despertar",
      "time": "5:30 AM",
      "lista": "Trello",
      "sonido": "Breaking",
      "enabled": true
    },
    {
      "title": "Pastillas",
      "time": "7:30 AM",
      "lista": "Google Tasks",
      "sonido": "Beep",
      "enabled": true
    },
    {
      "title": "Gimnasio",
      "time": "6:00 PM",
      "lista": "Asana",
      "sonido": "Chill",
      "enabled": true
    },
    {
      "title": "Antibiotico",
      "time": "3:30 PM",
      "lista": "Asana",
      "sonido": "Chill",
      "enabled": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final padding = width * 0.05;
    final titleFont = width * 0.035;
    final columnSpacing = width * 0.05;
    final tileSpacing = height * 0.015;
    final fabIconSize = width * 0.04;

    final activeAlarms =
        _alarms.where((alarm) => alarm["enabled"] == true).toList();
    final inactiveAlarms =
        _alarms.where((alarm) => alarm["enabled"] == false).toList();

    Widget buildColumn(List<Map<String, dynamic>> alarms) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.04),
                child: ListView.separated(
                  itemCount: alarms.length,
                  separatorBuilder: (_, __) => SizedBox(height: tileSpacing),
                  itemBuilder: (context, index) {
                    final alarm = alarms[index];
                    return AlarmTileWeb(
                      title: alarm["title"],
                      time: alarm["time"],
                      value: alarm["enabled"],
                      onChanged: (val) {
                        setState(() {
                          _alarms[_alarms.indexOf(alarm)]["enabled"] = val;
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
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBarWeb(),
              SizedBox(height: height * 0.02),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.04, bottom: height * 0.01),
                child: Text(
                  "Alarmas",
                  style: TextStyle(
                      fontSize: titleFont,
                      fontFamily: 'Rochester',
                      color: Colors.black),
                ),
              ),
              SizedBox(height: height * 0.01),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.04, bottom: height * 0.01),
                child: Divider(color: Colors.grey.shade300),
              ),
              SizedBox(height: height * 0.01),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildColumn(activeAlarms),
                    SizedBox(width: columnSpacing),
                    buildColumn(inactiveAlarms),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.04, bottom: height * 0.05),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const AlarmHistoryWebScreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.history,
                            size: height * 0.025, color: Colors.black),
                        label: Text(
                          "Historial",
                          style: TextStyle(
                            fontSize: width * 0.014,
                            color: Colors.black,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE2CCD6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.02),
                          ),
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.03,
                            vertical: height * 0.01,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: width * 0.04, bottom: height * 0.06),
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        shape: CircleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: width * 0.003,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AddAlarmWebScreen()),
                          );
                        },
                        child: Icon(Icons.add,
                            color: Colors.black, size: fabIconSize),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
