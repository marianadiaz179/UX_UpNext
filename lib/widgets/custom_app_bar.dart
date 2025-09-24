import 'package:flutter/material.dart';
import 'package:upnext_mobile/screens/notifications_screen.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback? onBack;

  const CustomAppBar({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Botón atrás
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
              child: const Icon(Icons.settings, color: Colors.black54, size: 24),
            ),
            const SizedBox(width: 16),

            // Notificaciones
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NotificationsScreen()),
                );
              },
              child: const Icon(Icons.notifications_none, color: Colors.black54, size: 24),
            ),
            const SizedBox(width: 16),

            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Funcionalidad no disponible")),
                );
              },
              child: const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFF7A627E),
                child: Icon(Icons.person, size: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}