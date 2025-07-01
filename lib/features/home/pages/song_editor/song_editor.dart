import 'package:flutter/material.dart';

class SongEditor extends StatelessWidget {
  const SongEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildMainContent();
  }

  Widget _buildMainContent() {
    return Center(child: Text('Song Editor Page'));
  }
}
