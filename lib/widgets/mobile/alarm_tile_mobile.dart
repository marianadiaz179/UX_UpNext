import 'package:flutter/material.dart';

class AlarmTileMobile extends StatelessWidget {
  final String title;
  final String time;
  final bool value;
  final ValueChanged<bool> onChanged;
  final VoidCallback onTap;

  const AlarmTileMobile({
    required this.title,
    required this.time,
    required this.value,
    required this.onChanged,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // Escala base para no agrandar demasiado
    final textScale = width * 0.035; // ~16 en un móvil normal (400px)
    final smallTextScale = width * 0.03; // ~14 en un móvil normal
    final paddingH = width * 0.04; // 16px aprox
    final paddingV = height * 0.015; // 12px aprox
    final radius = width * 0.02; // 8px aprox
    final gap = height * 0.005; // 4px aprox

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.05, right: width * 0.04),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
          decoration: BoxDecoration(
            color: const Color(0xFFEDEBF5),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: textScale.clamp(14, 18), // límites razonables
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: gap),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: smallTextScale.clamp(12, 16),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Switch(
                value: value,
                onChanged: onChanged,
                activeColor: Colors.black,
                activeTrackColor: Colors.black12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}