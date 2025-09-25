import 'package:flutter/material.dart';
import 'package:upnext_mobile/widgets/mobile/custom_app_bar_mobile.dart';
import 'package:upnext_mobile/widgets/mobile/task_tile_mobile.dart';

class TaskHistoryMobileScreen extends StatelessWidget {
  const TaskHistoryMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final double padding = (height * 0.02).clamp(8, 16);
    final double titleFontSize = (height * 0.045).clamp(20, 32);
    final double subtitleFontSize = (height * 0.02).clamp(12, 18);
    final double sectionFontSize = (height * 0.02).clamp(12, 18);
    final double tileSpacing = (height * 0.02).clamp(4, 12);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: (height * 0.07).clamp(40, 80),
                  child: const CustomAppBarMobile(),
                ),
                SizedBox(height: padding),

                // Título y subtítulo
                Padding(
                  padding: EdgeInsets.only(left: width * 0.05),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Historial",
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontFamily: 'Rochester',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.055),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Tareas",
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: tileSpacing / 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Divider(color: Colors.grey.shade300),
                ),
                SizedBox(height: tileSpacing),

                // Sección Activas
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.05, bottom: tileSpacing / 2),
                  child: Text(
                    "Activas",
                    style: TextStyle(
                      fontSize: sectionFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const TaskTileMobile(title: "Sacar Perro", time: "8:30 AM"),
                SizedBox(height: tileSpacing * 1.5),

                // Sección Cerradas
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.05, bottom: tileSpacing / 2),
                  child: Text(
                    "Cerradas",
                    style: TextStyle(
                      fontSize: sectionFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const TaskTileMobile(title: "Hacer mercado", time: "10:30 AM"),
                SizedBox(height: tileSpacing),
              ],
            ),
          ),
        ),
      ),
    );
  }
}