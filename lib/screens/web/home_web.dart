import 'dart:math';
import 'package:flutter/material.dart';
import 'package:upnext_mobile/screens/web/alarms_web.dart';
import 'package:upnext_mobile/screens/web/tasks_web.dart';
import 'package:upnext_mobile/widgets/web/custom_app_bar_web.dart';

class HomeWeb extends StatelessWidget {
  const HomeWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final double titleFont = min(max(width * 0.06, 24), 60); // limita entre 24 y 60
    final double subtitleFont = min(max(width * 0.02, 14), 28); // limita entre 14 y 28
    final double padding = min(max(width * 0.03, 12), 40);
    final double clockDiameter = min(max(height * 0.35, 200), 500); // reloj proporcional
    final double buttonWidth = min(max(width * 0.15, 120), 250);
    final double buttonHeight = min(max(height * 0.08, 40), 80);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              const CustomAppBarWeb(showBackButton: false),
              SizedBox(height: height * 0.005),
          
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
          
              SizedBox(height: height * 0.03),
              Divider(color: Colors.grey.shade300),
              SizedBox(height: height * 0.03),
          
              Center(
                child: SizedBox(
                  width: clockDiameter,
                  height: clockDiameter,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF2EEF4),
                        ),
                      ),
                      Positioned.fill(
                        child: CustomPaint(
                          painter: ClockNumbersPainter(fontSize: width * 0.015),
                        ),
                      ),
                      Transform.rotate(
                        angle: 3.7,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: width * 0.004,
                            height: clockDiameter * 0.5,
                            color: const Color(0xFF7A627E),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: CustomPaint(
                          painter: CircleAtSevenPainter(
                            circleRadius: width * 0.025,
                            fontSize: width * 0.018,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: height * 0.1),

              Padding(
                padding: EdgeInsets.only(bottom: height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _CustomButton(
                      label: "Alarmas",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const AlarmsWebScreen()),
                        );
                      },
                      width: buttonWidth,
                      height: buttonHeight,
                      fontSize: width * 0.015,
                    ),
                    SizedBox(width: width * 0.03),
                    _CustomButton(
                      label: "Tareas",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const TasksWebScreen()),
                        );
                      },
                      width: buttonWidth,
                      height: buttonHeight,
                      fontSize: width * 0.015,
                    ),
                    SizedBox(width: width * 0.025),
                    _CustomButton(
                      label: "Estadísticas",
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Funcionalidad no disponible")),
                        );
                      },
                      width: buttonWidth,
                      height: buttonHeight,
                      fontSize: width * 0.015,
                    ),
                  ],
                ),
              ),
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
        backgroundColor: const Color(0xFFD6DCF6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: Size(width, height),
        elevation: 0,
      ),
    );
  }
}

class ClockNumbersPainter extends CustomPainter {
  final double fontSize;
  ClockNumbersPainter({required this.fontSize});

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(color: Colors.black, fontSize: fontSize);
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
      text: const TextSpan(
        text: "7",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
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
