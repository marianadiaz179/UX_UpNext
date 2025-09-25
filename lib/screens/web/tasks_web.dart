import 'package:flutter/material.dart';
import 'package:upnext_mobile/screens/web/task_history_web.dart';
import 'package:upnext_mobile/widgets/web/custom_app_bar_web.dart';
import 'package:upnext_mobile/widgets/web/task_tile_web.dart';

class TasksWebScreen extends StatefulWidget {
  const TasksWebScreen({super.key});

  @override
  State<TasksWebScreen> createState() => _TasksWebScreenState();
}

class _TasksWebScreenState extends State<TasksWebScreen> {
  final List<Map<String, String>> pendientes = [
    {"title": "Sacar Perro", "time": "8:30 AM"},
    {"title": "Llamar al médico", "time": "10:00 AM"},
  ];

  final List<Map<String, String>> diarias = [
    {"title": "Beber agua", "time": "9:00 AM"},
    {"title": "Estiramientos", "time": "6:00 PM"},
  ];

  final List<Map<String, String>> trabajo = [
    {"title": "Reunión equipo", "time": "11:00 AM"},
    {"title": "Enviar reporte", "time": "3:00 PM"},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final padding = width * 0.05;
    final titleFont = width * 0.035;
    final subtitleFont = width * 0.018;
    final tileSpacing = height * 0.02;

    Widget buildColumn(String title, List<Map<String, String>> tasks) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.01),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: subtitleFont,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: tileSpacing),
            Expanded(
              child: ListView.separated(
                itemCount: tasks.length,
                separatorBuilder: (_, __) => SizedBox(height: tileSpacing),
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TaskTileWeb(
                    title: task["title"]!,
                    time: task["time"]!,
                    onTap: () {},
                  );
                },
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
                child: Text("Tareas",
                    style: TextStyle(
                        fontSize: titleFont,
                        fontFamily: 'Rochester',
                        color: Colors.black)),
              ),
              SizedBox(height: height * 0.01),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.04, bottom: height * 0.01),
                child: Divider(color: Colors.grey.shade300),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.04,
                      bottom: height * 0.05,
                      top: height * 0.03),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildColumn("Pendientes", pendientes),
                      SizedBox(width: padding),
                      buildColumn("Diarias", diarias),
                      SizedBox(width: padding),
                      buildColumn("Trabajo", trabajo),
                    ],
                  ),
                ),
              ),
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
                          builder: (_) => const TaskHistoryWebScreen(),
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
            ],
          ),
        ),
      ),
    );
  }
}
