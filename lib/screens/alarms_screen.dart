import 'package:flutter/material.dart';
import 'package:upnext_mobile/screens/add_alarm_screen.dart';
import 'package:upnext_mobile/screens/alarm_history_screen.dart';
import 'package:upnext_mobile/widgets/alarm_tile.dart';
import 'package:upnext_mobile/widgets/custom_app_bar.dart';
import 'alarm_detail_screen.dart';

class AlarmsScreen extends StatefulWidget {
  const AlarmsScreen({super.key});

  @override
  State<AlarmsScreen> createState() => _AlarmsScreenState();
}

class _AlarmsScreenState extends State<AlarmsScreen> {
  // Lista de alarmas con estado (true = activa, false = apagada)
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

    final padding = width * 0.04; // padding general
    final titleFont = width * 0.1; // tamaño proporcional
    final dividerSpacing = height * 0.015;
    final alarmSpacing = height * 0.02;
    final buttonFont = width * 0.04;
    final fabIconSize = width * 0.07;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              SizedBox(height: height * 0.02),

              // Título
              Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: Text(
                  "Alarmas",
                  style: TextStyle(
                    fontSize: titleFont,
                    fontFamily: 'Cursive',
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: height * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Divider(color: Colors.grey.shade300),
              ),
              SizedBox(height: dividerSpacing),

              // Lista de alarmas
              ..._alarms.asMap().entries.map((entry) {
                int index = entry.key;
                var alarm = entry.value;

                return Padding(
                  padding: EdgeInsets.only(bottom: alarmSpacing),
                  child: AlarmTile(
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
                          builder: (_) => AlarmDetailScreen(
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

              SizedBox(height: height * 0.03),

              // Botón historial
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: width * 0.04),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const AlarmHistoryScreen()),
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
                        borderRadius: BorderRadius.circular(width * 0.05),
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

              const Spacer(),

              // Botón flotante
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(right: width * 0.04),
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
                            builder: (_) => const AddAlarmScreen()),
                      );
                    },
                    child: Icon(Icons.add,
                        color: Colors.black, size: fabIconSize),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}