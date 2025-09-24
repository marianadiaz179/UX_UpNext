import 'package:flutter/material.dart';
import 'package:upnext_mobile/widgets/alarm_tile.dart';
import 'package:upnext_mobile/widgets/custom_app_bar.dart';
import 'alarm_detail_screen.dart';

class AlarmHistoryScreen extends StatefulWidget {
  const AlarmHistoryScreen({super.key});

  @override
  State<AlarmHistoryScreen> createState() => _AlarmHistoryScreenState();
}

class _AlarmHistoryScreenState extends State<AlarmHistoryScreen> {
  // Lista de alarmas activas
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

  // Lista de alarmas cerradas
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
    final double screenHeight = MediaQuery.of(context).size.height;
    final double padding = screenHeight * 0.02;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: ListView(
            children: [
              const CustomAppBar(),
              SizedBox(height: padding),

              // Título principal
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Historial",
                  style: TextStyle(
                    fontSize: 38,
                    fontFamily: 'Cursive',
                    color: Colors.black,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 22),
                child: Text(
                  "Alarmas",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 15),
                child: Divider(color: Colors.grey.shade300),
              ),
              SizedBox(height: padding),

              // Sección activas
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "Activas",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ..._activeAlarms.asMap().entries.map((entry) {
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
                        _activeAlarms[index]["enabled"] = val;
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

              SizedBox(height: padding * 1.5),

              // Sección cerradas
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "Cerradas",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ..._closedAlarms.asMap().entries.map((entry) {
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
                        _closedAlarms[index]["enabled"] = val;
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
            ],
          ),
        ),
      ),
    );
  }
}