import 'package:flutter/material.dart';
import 'package:upnext_mobile/widgets/mobile/custom_app_bar_mobile.dart';
import 'package:upnext_mobile/widgets/mobile/notification_tile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBarMobile(),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: Text(
                  "Notificaciones",
                  style: TextStyle(
                    fontSize: width * 0.09,
                    fontFamily: 'Rochester',
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: height * 0.012),
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.05,
                  right: width * 0.04,
                ),
                child: Divider(color: Colors.grey.shade300, thickness: 1),
              ),
              SizedBox(height: height * 0.025),
              NotificationTile(
                title: "Alarma - Despertar",
                message:
                    "Su alarma se ha actualizado para sonar a las 5:00 AM todos los días",
              ),
              SizedBox(height: height * 0.02),
              NotificationTile(
                title: "Tarea - Hacer mercado",
                message:
                    "Su tarea Hacer Mercado ha sido finalizada exitosamente",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
