import 'package:flutter/material.dart';
import 'package:upnext_mobile/screens/notifications_screen.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? onBack;

  const CustomAppBar({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    // Escalas proporcionales
    final double iconSize = (width * 0.06).clamp(20, 26); // Tamaño de iconos
    final double spacing = (width * 0.04).clamp(12, 18); // Espaciado entre iconos
    final double avatarRadius = (width * 0.045).clamp(16, 20); // Radio del avatar
    final double avatarIconSize = (width * 0.05).clamp(16, 22); // Ícono dentro del avatar

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Botón atrás
        IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: iconSize),
          onPressed: onBack ?? () => Navigator.pop(context),
        ),

        // Íconos a la derecha
        Row(
          children: [
            // Settings
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Funcionalidad no disponible")),
                );
              },
              child: Icon(Icons.settings, color: Colors.black54, size: iconSize),
            ),
            SizedBox(width: spacing),

            // Notificaciones
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NotificationsScreen()),
                );
              },
              child: Icon(Icons.notifications_none, color: Colors.black54, size: iconSize),
            ),
            SizedBox(width: spacing),

            // Avatar usuario
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