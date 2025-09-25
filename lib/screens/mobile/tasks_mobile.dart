import 'package:flutter/material.dart';
import 'package:upnext_mobile/screens/mobile/task_history_mobile.dart';
import 'package:upnext_mobile/widgets/mobile/custom_app_bar_mobile.dart';
import 'package:upnext_mobile/widgets/mobile/task_tile_mobile.dart';

class TasksMobileScreen extends StatelessWidget {
  const TasksMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final double paddingHorizontal = (width * 0.04).clamp(8, 16);
    final double paddingVertical = (height * 0.02).clamp(4, 12);
    final double titleFont = (width * 0.1).clamp(18, 32);
    final double dividerSpacing = (height * 0.015).clamp(4, 12);
    final double tileSpacing = (height * 0.02).clamp(4, 12);
    final double buttonFont = (width * 0.035).clamp(12, 18);    
    final double buttonIconSize = (width * 0.045).clamp(16, 24);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal, vertical: paddingVertical),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBarMobile(),
                SizedBox(height: height * 0.02),

                // Título
                Padding(
                  padding: EdgeInsets.only(left: width * 0.05),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Tareas",
                      style: TextStyle(
                        fontSize: titleFont,
                        fontFamily: 'Rochester',
                        color: Colors.black,
                      ),
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
                const TaskTileMobile(title: "Sacar Perro", time: "8:30 AM"),
                SizedBox(height: tileSpacing),
                const TaskTileMobile(title: "Llamar al médico", time: "10:00 AM"),
                SizedBox(height: tileSpacing),
                const TaskTileMobile(title: "Comprar mercado", time: "6:00 PM"),
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
                            builder: (_) => const TaskHistoryMobileScreen(),
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
                SizedBox(height: height * 0.02), // Espacio inferior
              ],
            ),
          ),
        ),
      ),
    );
  }
}