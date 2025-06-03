import 'package:flutter/material.dart';

class TopNavWidget extends StatelessWidget {
  final VoidCallback? onBellTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onAvatarTap;

  const TopNavWidget({
    super.key,
    this.onBellTap,
    this.onSearchTap,
    this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Logo and text
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(Icons.play_arrow,
                      color: Colors.white, size: 16),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Music',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Notification Bell
            IconButton(
              onPressed: onBellTap,
              icon: const Icon(Icons.notifications_none, color: Colors.white),
            ),

            // Search Icon
            IconButton(
              onPressed: onSearchTap,
              icon: const Icon(Icons.search, color: Colors.white),
            ),

            // User Avatar
            GestureDetector(
              onTap: onAvatarTap,
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white30,
                child: Text(
                  'J',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
