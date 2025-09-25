import 'dart:math';
import 'package:flutter/material.dart';
import 'package:upnext_mobile/screens/mobile/alarms_mobile.dart';
import 'package:upnext_mobile/screens/mobile/tasks_mobile.dart';
import 'package:upnext_mobile/widgets/mobile/custom_app_bar_mobile.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; 
    final width = size.width;
    final height = size.height;

    final padding = width * 0.05; 
    final titleFont = width * 0.12;
    final subtitleFont = width * 0.035;
    final dividerSpacing = height * 0.03;
    final clockDiameter = width * 0.6;
    final handThickness = width * 0.01;
    final handLength = clockDiameter * 0.5;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBarMobile(showBackButton: false),
              SizedBox(height: height * 0.05),

              // Logo
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "UpNext",
                      style: TextStyle(
                        fontSize: titleFont,
                        fontFamily: 'Rochester',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Productivity",
                      style: TextStyle(
                        fontSize: subtitleFont,
                        fontFamily: 'Risque',
                        fontWeight: FontWeight.w300,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: dividerSpacing),
              Divider(color: Colors.grey.shade300),
              SizedBox(height: dividerSpacing),

              // Clock
              Center(
                child: SizedBox(
                  width: clockDiameter,
                  height: clockDiameter,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // fondo del reloj
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFEDEFF1),
                        ),
                      ),

                      // números
                      Positioned.fill(
                        child: CustomPaint(
                          painter: ClockNumbersPainter(
                            fontSize: width * 0.04,
                          ),
                        ),
                      ),

                      // manecilla
                      Transform.rotate(
                        angle: 3.7,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: handThickness,
                            height: handLength,
                            color: const Color(0xFF7A627E),
                          ),
                        ),
                      ),

                      // círculo en el 7
                      Positioned.fill(
                        child: CustomPaint(
                          painter: CircleAtSevenPainter(
                            circleRadius: width * 0.07,
                            fontSize: width * 0.045,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: dividerSpacing),
              Divider(color: Colors.grey.shade300),
              SizedBox(height: dividerSpacing),

              // Botones
              Center(
                child: Column(
                  children: [
                    _CustomButton(
                      label: "Alarmas",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AlarmsMobileScreen()),
                        );
                      },
                      width: width * 0.5,
                      height: height * 0.07,
                      fontSize: width * 0.05,
                    ),
                    SizedBox(height: height * 0.03),
                    _CustomButton(
                      label: "Tareas",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const TasksMobileScreen()),
                        );
                      },
                      width: width * 0.5,
                      height: height * 0.07,
                      fontSize: width * 0.05,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double fontSize;

  const _CustomButton({
    required this.label,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.star_border, color: Colors.black87),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.black87,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE2CCD6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(width, height),
        elevation: 0,
      ),
    );
  }
}

// Painter para los números del reloj
class ClockNumbersPainter extends CustomPainter {
  final double fontSize;
  ClockNumbersPainter({required this.fontSize});

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: fontSize,
    );

    final radius = size.width / 2;
    final center = Offset(radius, radius);

    for (int i = 1; i <= 12; i++) {
      final angle = (i * 30 - 90) * pi / 180;
      final offset = Offset(
        center.dx + radius * 0.8 * cos(angle),
        center.dy + radius * 0.8 * sin(angle),
      );

      final textPainter = TextPainter(
        text: TextSpan(text: "$i", style: textStyle),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(
        canvas,
        offset - Offset(textPainter.width / 2, textPainter.height / 2),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Painter para el círculo en el número 7
class CircleAtSevenPainter extends CustomPainter {
  final double circleRadius;
  final double fontSize;

  CircleAtSevenPainter({
    required this.circleRadius,
    required this.fontSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final center = Offset(radius, radius);

    final angle = (7 * 30 - 90) * pi / 180;
    final offset = Offset(
      center.dx + radius * 0.8 * cos(angle),
      center.dy + radius * 0.8 * sin(angle),
    );

    final paint = Paint()..color = const Color(0xFF7A627E);
    canvas.drawCircle(offset, circleRadius, paint);

    final textPainter = TextPainter(
      text: const TextSpan(text: "7"),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      textScaleFactor: fontSize / 20,
    )..layout();

    textPainter.paint(
      canvas,
      offset - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}