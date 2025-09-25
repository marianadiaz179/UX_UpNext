import 'package:flutter/material.dart';

class TaskTileMobile extends StatefulWidget {
  final String title;
  final String time;

  const TaskTileMobile({super.key, required this.title, required this.time});

  @override
  State<TaskTileMobile> createState() => _TaskTileMobileState();
}

class _TaskTileMobileState extends State<TaskTileMobile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final textScale = width * 0.035;
    final smallTextScale = width * 0.03;
    final paddingH = width * 0.04;
    final paddingV = height * 0.015;
    final radius = width * 0.02;
    final gap = width * 0.02;

    return Padding(
      padding: EdgeInsets.only(left: width * 0.05, right: width * 0.04),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
        decoration: BoxDecoration(
          color: const Color(0xFFEDEBF5),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(
          children: [
            // Checkbox dinámico
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.01),
              ),
              activeColor: const Color(0xFF7A627E),
              checkColor: Colors.white,
            ),
            SizedBox(width: gap),

            // Texto de la tarea
            Expanded(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: textScale.clamp(14, 18), // rango razonable
                  fontWeight: FontWeight.w500,
                  decoration: isChecked ? TextDecoration.lineThrough : null,
                  color: isChecked ? Colors.grey : Colors.black,
                ),
              ),
            ),

            // Hora
            Text(
              widget.time,
              style: TextStyle(
                fontSize: smallTextScale.clamp(12, 16),
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}