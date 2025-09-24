import 'package:flutter/material.dart';
import 'package:upnext_mobile/widgets/custom_app_bar.dart';
import 'package:upnext_mobile/widgets/notification_tile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
                  "Notificaciones",
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

              const NotificationTile(
                title: "Alarma - Despertar",
                message: "Su alarma se ha actualizado para sonar a las 5:00 AM todos los días",
              ),
              const SizedBox(height: 20),

              // Notificación 2
              const NotificationTile(
                title: "Tarea - Hacer mercado",
                message: "Su tarea Hacer Mercado ha sido finalizada exitosamente",
              ),
            ],
          ),
        ),
      ),
    );
  }
}