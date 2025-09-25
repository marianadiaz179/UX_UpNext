import 'package:flutter/material.dart';

class AlarmTileWeb extends StatelessWidget {
  final String title;
  final String time;
  final bool value;
  final ValueChanged<bool> onChanged;
  final VoidCallback onTap;

  const AlarmTileWeb({
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

    final containerWidth = width * 0.5; 
    final containerHeight = height * 0.11;
    final paddingH = width * 0.02;
    final paddingV = height * 0.015;
    final textScale = width * 0.004;
    final smallTextScale = width * 0.001;
    final gap = height * 0.005;

    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: containerWidth,
          height: containerHeight,
          padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
          decoration: BoxDecoration(
            color: const Color(0xFFEDEBF5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: textScale.clamp(16, 22),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: gap),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: smallTextScale.clamp(14, 18),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),

              // Switch
              Transform.scale(
                scale: 1.2, // más grande en web
                child: Switch(
                  value: value,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                  activeTrackColor: Colors.black12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}