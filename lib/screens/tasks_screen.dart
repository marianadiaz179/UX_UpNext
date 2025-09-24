import 'package:flutter/material.dart';
import 'package:upnext_mobile/screens/task_history_screen.dart';
import 'package:upnext_mobile/widgets/custom_app_bar.dart';
import 'package:upnext_mobile/widgets/task_tile.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

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
                  "Tareas",
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

              // Lista de tareas
              const TaskTile(title: "Sacar Perro", time: "8:30 AM"),
              const SizedBox(height: 15),
              const TaskTile(title: "Llamar al médico", time: "10:00 AM"),
              const SizedBox(height: 15),
              const TaskTile(title: "Comprar mercado", time: "6:00 PM"),

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
                        MaterialPageRoute(builder: (_) => const TaskHistoryScreen()),
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
            ],
          ),
        ),
      ),
    );
  }
}