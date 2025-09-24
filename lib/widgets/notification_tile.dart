import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String message;

  const NotificationTile({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    // Escalas proporcionales
    final double horizontalPadding = (width * 0.04).clamp(12, 20); 
    final double verticalPadding = (width * 0.03).clamp(8, 16); 
    final double fontSizeTitle = (width * 0.042).clamp(14, 18); 
    final double fontSizeMessage = (width * 0.038).clamp(12, 16); 
    final double spacing = (width * 0.015).clamp(4, 8); 
    final double borderRadius = (width * 0.02).clamp(4, 8); 

    return Padding(
      padding: EdgeInsets.only(
        left: horizontalPadding,
        right: horizontalPadding,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFEDEBF5),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSizeTitle,
              ),
            ),
            SizedBox(height: spacing),
            Text(
              message,
              style: TextStyle(
                fontSize: fontSizeMessage,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}