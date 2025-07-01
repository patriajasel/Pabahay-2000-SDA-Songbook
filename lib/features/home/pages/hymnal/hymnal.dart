import 'package:flutter/material.dart';

class Hymnal extends StatelessWidget {
  const Hymnal({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildMainContent();
  }

  Widget _buildMainContent() {
    return Center(child: Text('Hymnal Page'));
  }
}
