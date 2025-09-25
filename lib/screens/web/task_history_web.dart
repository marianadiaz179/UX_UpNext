import 'package:flutter/material.dart';
import 'package:upnext_mobile/widgets/web/custom_app_bar_web.dart';
import 'package:upnext_mobile/widgets/web/task_tile_web.dart';

class TaskHistoryWebScreen extends StatefulWidget {
  const TaskHistoryWebScreen({super.key});

  @override
  State<TaskHistoryWebScreen> createState() => _TaskHistoryWebScreenState();
}

class _TaskHistoryWebScreenState extends State<TaskHistoryWebScreen> {
  final List<Map<String, dynamic>> _tasks = [
    {"title": "Sacar Perro", "time": "8:30 AM", "completed": false},
    {"title": "Hacer mercado", "time": "10:30 AM", "completed": true},
    {"title": "Enviar informe", "time": "2:00 PM", "completed": false},
    {"title": "Llamar cliente", "time": "4:30 PM", "completed": true},
  ];

  void _exportTasks() {
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

    final activeTasks = _tasks.where((t) => t["completed"] == false).toList();
    final closedTasks = _tasks.where((t) => t["completed"] == true).toList();

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
                  "Tareas",
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
                            ...activeTasks.map((task) {
                              int index = _tasks.indexOf(task);
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: height * 0.02,
                                  left: width * 0.04,
                                  right: width * 0.01,
                                ),
                                child: TaskTileWeb(
                                  title: task["title"],
                                  time: task["time"],
                                  onTap: () {
                                    setState(() {
                                      _tasks[index]["completed"] = true;
                                    });
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
                            ...closedTasks.map((task) {
                              int index = _tasks.indexOf(task);
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: height * 0.02,
                                  left: width * 0.01,
                                  right: width * 0.02,
                                ),
                                child: TaskTileWeb(
                                  title: task["title"],
                                  time: task["time"],
                                  onTap: () {
                                    setState(() {
                                      _tasks[index]["completed"] = false;
                                    });
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
                    onPressed: _exportTasks,
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
