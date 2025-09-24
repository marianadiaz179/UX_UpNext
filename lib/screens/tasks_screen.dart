import 'package:flutter/material.dart';
import 'package:upnext_mobile/screens/task_history_screen.dart';
import 'package:upnext_mobile/widgets/custom_app_bar.dart';
import 'package:upnext_mobile/widgets/task_tile.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final padding = width * 0.04;
    final titleFont = width * 0.1;
    final dividerSpacing = height * 0.015;
    final tileSpacing = height * 0.02;
    final buttonFont = width * 0.04;
    final buttonIconSize = width * 0.045;

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
                  "Tareas",
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

              // Lista de tareas
              const TaskTile(title: "Sacar Perro", time: "8:30 AM"),
              SizedBox(height: tileSpacing),
              const TaskTile(title: "Llamar al médico", time: "10:00 AM"),
              SizedBox(height: tileSpacing),
              const TaskTile(title: "Comprar mercado", time: "6:00 PM"),

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
                          builder: (_) => const TaskHistoryScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.history,
                        size: buttonIconSize, color: Colors.black),
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
            ],
          ),
        ),
      ),
    );
  }
}