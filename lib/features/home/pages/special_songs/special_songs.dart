import 'package:flutter/material.dart';

class SpecialSongs extends StatelessWidget {
  const SpecialSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildMainContent();
  }

  Widget _buildMainContent() {
    return Center(child: Text('Special Songs Page'));
  }
}
