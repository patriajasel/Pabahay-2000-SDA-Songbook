import 'package:flutter/material.dart';

class SpecialTab extends StatelessWidget {
  const SpecialTab({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildTabContent(
      context: context,
      icon: Icons.notifications_outlined,
      title: 'Special Songs',
      description: 'Special occasion songs',
      color: Colors.orange,
    );
  }
}

Widget _buildTabContent({
  required BuildContext context,
  required IconData icon,
  required String title,
  required String description,
  required Color color,
}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 64, color: color),
        ),
        const SizedBox(height: 24),
        Text(
          title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
      ],
    ),
  );
}
