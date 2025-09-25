import 'package:flutter/material.dart';
import 'package:upnext_mobile/screens/mobile/add_alarm_mobile.dart';
import 'package:upnext_mobile/screens/mobile/alarm_history_mobile.dart';
import 'package:upnext_mobile/widgets/mobile/alarm_tile_mobile.dart';
import 'package:upnext_mobile/widgets/mobile/custom_app_bar_mobile.dart';
import 'alarm_detail_mobile.dart';

class AlarmsMobileScreen extends StatefulWidget {
  const AlarmsMobileScreen({super.key});

  @override
  State<AlarmsMobileScreen> createState() => _AlarmsMobileScreenState();
}

class _AlarmsMobileScreenState extends State<AlarmsMobileScreen> {
  final List<Map<String, dynamic>> _alarms = [
    {
      "title": "Despertar",
      "time": "5:30 AM",
      "lista": "Trello",
      "sonido": "Breaking",
      "enabled": true,
    },
    {
      "title": "Pastillas",
      "time": "7:30 AM",
      "lista": "Google Tasks",
      "sonido": "Beep",
      "enabled": false,
    },
    {
      "title": "Gimnasio",
      "time": "6:00 PM",
      "lista": "Asana",
      "sonido": "Chill",
      "enabled": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final double paddingHorizontal = (width * 0.04).clamp(8, 16);
    final double paddingVertical = (height * 0.02).clamp(4, 12);
    final double titleFont = (width * 0.1).clamp(18, 32);
    final double buttonFont = (width * 0.035).clamp(12, 18);
    final double fabIconSize = (width * 0.07).clamp(24, 36);
    final double dividerSpacing = (height * 0.015).clamp(4, 12);
    final double alarmSpacing = (height * 0.02).clamp(4, 12);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: paddingHorizontal, vertical: paddingVertical),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBarMobile(),
                  SizedBox(height: height * 0.015),

                  // Título escalable
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Alarmas",
                        style: TextStyle(
                          fontSize: titleFont,
                          fontFamily: 'Rochester',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    child: Divider(color: Colors.grey.shade300),
                  ),
                  SizedBox(height: dividerSpacing),

                  // Lista de alarmas scrollable
                  Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              children: _alarms.asMap().entries.map((entry) {
                                int index = entry.key;
                                var alarm = entry.value;

                                return Padding(
                                  padding:
                                      EdgeInsets.only(bottom: alarmSpacing),
                                  child: AlarmTileMobile(
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
                                          builder: (_) =>
                                              AlarmDetailMobileScreen(
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
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: width * 0.02, bottom: height * 0.01),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const AlarmHistoryMobileScreen()),
                                    );
                                  },
                                  icon: Icon(Icons.history,
                                      size: width * 0.045, color: Colors.black),
                                  label: Text(
                                    "Historial",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: buttonFont,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE2CCD6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(width * 0.05),
                                    ),
                                    elevation: 0,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.05,
                                      vertical: height * 0.012,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(height: height * 0.01),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: width * 0.04, bottom: height * 0.02),
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    shape: CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: width * 0.005,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const AddAlarmMobileScreen()),
                      );
                    },
                    child:
                        Icon(Icons.add, color: Colors.black, size: fabIconSize),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
