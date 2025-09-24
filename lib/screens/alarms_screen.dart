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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const CustomAppBar(),

              const SizedBox(height: 20),

              // Título
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Alarmas",
                  style: TextStyle(
                    fontSize: 38,
                    fontFamily: 'Cursive',
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 15),
                child: Divider(color: Colors.grey.shade300),
              ),
              const SizedBox(height: 20),

              // Lista de alarmas
              ..._alarms.asMap().entries.map((entry) {
                int index = entry.key;
                var alarm = entry.value;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
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

              const SizedBox(height: 30),

              // Botón historial
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AlarmHistoryScreen()),
                      );
                    },
                    icon: const Icon(Icons.history, size: 18, color: Colors.black),
                    label: const Text(
                      "Historial",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE2CCD6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Botón flotante
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(
                      side: BorderSide(color: Colors.black, width: 2),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AddAlarmScreen()),
                      );
                    },
                    child: const Icon(Icons.add, color: Colors.black, size: 28),
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

