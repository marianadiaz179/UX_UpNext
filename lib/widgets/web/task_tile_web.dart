import 'package:flutter/material.dart';

class TaskTileWeb extends StatefulWidget {
  final String title;
  final String time;
  final VoidCallback? onTap;

  const TaskTileWeb({
    super.key,
    required this.title,
    required this.time,
    this.onTap,
  });

  @override
  State<TaskTileWeb> createState() => _TaskTileWebState();
}

class _TaskTileWebState extends State<TaskTileWeb> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final containerWidth = width * 0.5; 
    final containerHeight = height * 0.075;
    final paddingH = width * 0.02;
    final paddingV = height * 0.02;
    final textScale = width * 0.004;
    final smallTextScale = width * 0.001;
    final gap = height * 0.005;

    return GestureDetector(
      onTap: widget.onTap,
      child: Center(
        child: Container(
          width: containerWidth,
          height: containerHeight,
          padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
          decoration: BoxDecoration(
            color: const Color(0xFFEDEBF5),
          ),
          child: Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.005),
                ),
                activeColor: const Color(0xFF7A627E),
                checkColor: Colors.white,
              ),
              SizedBox(width: gap),
        
              // Título de la tarea
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: textScale.clamp(14, 18),
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
      ),
    );
  }
}