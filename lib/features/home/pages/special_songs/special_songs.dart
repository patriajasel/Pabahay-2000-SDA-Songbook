import 'package:church_songbook_app/shared/common/app_layout_wrapper.dart';
import 'package:flutter/material.dart';

class SpecialSongs extends StatelessWidget {
  const SpecialSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayoutWrapper(
      showSettings: false,
      includeTitleBar: true,
      child: _buildMainContent(),
    );
  }

  Widget _buildMainContent() {
    return Center(child: Text('Special Songs Page'));
  }
}
