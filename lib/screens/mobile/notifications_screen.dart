import 'package:flutter/material.dart';
import 'package:upnext_mobile/widgets/mobile/custom_app_bar_mobile.dart';
import 'package:upnext_mobile/widgets/mobile/notification_tile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final double padding = (width * 0.04).clamp(8, 16);
    final double titleFont = (width * 0.09).clamp(18, 32);
    final double spacingSmall = (height * 0.012).clamp(4, 12);
    final double spacingMedium = (height * 0.02).clamp(4, 16);
    final double spacingLarge = (height * 0.025).clamp(6, 20);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBarMobile(),
                SizedBox(height: spacingMedium),

                // Título
                Padding(
                  padding: EdgeInsets.only(left: width * 0.05),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Notificaciones",
                      style: TextStyle(
                        fontSize: titleFont,
                        fontFamily: 'Rochester',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: spacingSmall),

                // Divider
                Padding(
                  padding: EdgeInsets.only(left: width * 0.05, right: width * 0.04),
                  child: Divider(color: Colors.grey.shade300, thickness: 1),
                ),
                SizedBox(height: spacingLarge),

                // Notificaciones
                NotificationTile(
                  title: "Alarma - Despertar",
                  message:
                      "Su alarma se ha actualizado para sonar a las 5:00 AM todos los días",
                ),
                SizedBox(height: spacingMedium),
                NotificationTile(
                  title: "Tarea - Hacer mercado",
                  message:
                      "Su tarea Hacer Mercado ha sido finalizada exitosamente",
                ),
                SizedBox(height: spacingMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}