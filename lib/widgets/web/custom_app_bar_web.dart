import 'package:flutter/material.dart';

class CustomAppBarWeb extends StatelessWidget {
  final VoidCallback? onBack;
  final bool showBackButton;

  const CustomAppBarWeb({
    super.key,
    this.onBack,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    final double iconSize = (width * 0.06).clamp(20, 26);
    final double spacing = (width * 0.04).clamp(12, 18);
    final double avatarRadius = (width * 0.045).clamp(16, 20);
    final double avatarIconSize = (width * 0.05).clamp(16, 22);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (showBackButton)
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black, size: iconSize),
            onPressed: onBack ?? () => Navigator.pop(context),
          )
        else
          SizedBox(width: iconSize + spacing),

        Row(
          children: [
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Funcionalidad no disponible")),
                );
              },
              child: Icon(Icons.settings, color: Colors.black54, size: iconSize),
            ),
            SizedBox(width: spacing),

            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Funcionalidad no disponible")),
                );
              },
              child: CircleAvatar(
                radius: avatarRadius.toDouble(),
                backgroundColor: const Color(0xFF7A627E),
                child: Icon(Icons.person, size: avatarIconSize, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}