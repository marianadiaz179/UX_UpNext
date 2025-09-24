import 'dart:math';
import 'package:flutter/material.dart';
import 'package:upnext_mobile/screens/alarms_screen.dart';
import 'package:upnext_mobile/screens/tasks_screen.dart';
import 'package:upnext_mobile/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const CustomAppBar(),
              const SizedBox(height: 40),

              // Logo
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Center(
                    child: Text(
                      "UpNext",
                      style: TextStyle(
                        fontSize: 64,
                        fontFamily: 'Cursive',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Productivity",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              Divider(color: Colors.grey.shade300),
              const SizedBox(height: 30),

              // Clock (radio = 256 px, diámetro = 512 px)
              Center(
                child: SizedBox(
                  width: 256,
                  height: 256,
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
                          painter: ClockNumbersPainter(),
                        ),
                      ),

                      // manecilla
                      Transform.rotate(
                        angle: 3.7, // en radianes (ajusta según hora)
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 4,
                            height: 130, // se ajusta proporcional al radio
                            color: const Color(0xFF7A627E),
                          ),
                        ),
                      ),

                      // círculo en el 7 (posición automática)
                      Positioned.fill(
                        child: CustomPaint(
                          painter: CircleAtSevenPainter(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
              Divider(color: Colors.grey.shade300),
              const SizedBox(height: 30),

              // Botones
              Center(
                child: Column(
                  children:  [
                    _CustomButton(
                        label: "Alarmas",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const AlarmsScreen()),
                          );
                        },
                      ),
                    SizedBox(height: 20),
                    _CustomButton(
                        label: "Tareas",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const TasksScreen()),
                          );
                        },
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
  const _CustomButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.star_border, color: Colors.black87),
      label: Text(
        label,
        style: const TextStyle(color: Colors.black87, fontSize: 22, fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE2CCD6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(184, 64),
        elevation: 0,
      ),
    );
  }
}

// Painter para los números del reloj
class ClockNumbersPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 16,
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
  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final center = Offset(radius, radius);

    // número 7 → ángulo
    final angle = (7 * 30 - 90) * pi / 180;
    final offset = Offset(
      center.dx + radius * 0.8 * cos(angle),
      center.dy + radius * 0.8 * sin(angle),
    );

    // círculo
    final paint = Paint()..color = const Color(0xFF7A627E);
    canvas.drawCircle(offset, 28, paint);

    // texto
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    final textPainter = TextPainter(
      text: const TextSpan(text: "7", style: textStyle),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout();

    textPainter.paint(
      canvas,
      offset - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}