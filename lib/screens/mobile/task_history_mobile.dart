import 'package:flutter/material.dart';
import 'package:upnext_mobile/widgets/mobile/custom_app_bar_mobile.dart';
import 'package:upnext_mobile/widgets/mobile/task_tile_mobile.dart';

class TaskHistoryMobileScreen extends StatelessWidget {
  const TaskHistoryMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    final double padding = screenHeight * 0.02;
    final double titleFontSize = screenHeight * 0.045;
    final double subtitleFontSize = screenHeight * 0.02;
    final double sectionFontSize = screenHeight * 0.02;
    final double tileSpacing = screenHeight * 0.02;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: ListView(
              children: [
                SizedBox(
                  height: screenHeight * 0.07,
                  child: const CustomAppBarMobile(),
                ),
                SizedBox(height: padding),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.05),
                  child: Text(
                    "Historial",
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontFamily: 'Rochester',
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.055),
                  child: Text(
                    "Tareas",
                    style: TextStyle(
                      fontSize: subtitleFontSize,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: tileSpacing / 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Divider(color: Colors.grey.shade300),
                ),
                SizedBox(height: tileSpacing),

                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05, bottom: tileSpacing / 2),
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

                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05, bottom: tileSpacing / 2),
                  child: Text(
                    "Cerradas",
                    style: TextStyle(
                      fontSize: sectionFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const TaskTileMobile(title: "Hacer mercado", time: "10:30 AM"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}