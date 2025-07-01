import 'package:church_songbook_app/features/home/home_page.dart';
import 'package:church_songbook_app/features/home/pages/hymnal/hymnal.dart';
import 'package:church_songbook_app/features/home/pages/response_hymns/response_hymns.dart';
import 'package:church_songbook_app/features/home/pages/song_editor/song_editor.dart';
import 'package:church_songbook_app/features/home/pages/special_songs/special_songs.dart';
import 'package:church_songbook_app/shared/common/app_layout_wrapper.dart';
import 'package:flutter/material.dart';

class MainAppNavigator extends StatefulWidget {
  const MainAppNavigator({super.key});

  @override
  State<MainAppNavigator> createState() => _MainAppNavigatorState();
}

class _MainAppNavigatorState extends State<MainAppNavigator> {
  int _selectedIndex = -1; // -1 for home page

  final List<Widget> _pages = [
    const Hymnal(), // Index 0
    const ResponseHymns(), // Index 1
    const SpecialSongs(), // Index 2
    const SongEditor(), // Index 3
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _goToHome() {
    setState(() {
      _selectedIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show home page
    if (_selectedIndex == -1) {
      return AppLayoutWrapper(
        showSettings: true,
        onSettingsPressed: () {
          // Handle settings navigation
        },
        child: HomePage(onNavigate: _onItemSelected),
      );
    }

    // Show other pages with sidebar navigation
    return AppLayoutWrapper(
      includeSideNavigation: true,
      showSettings: false,
      selectedIndex: _selectedIndex,
      onItemSelected: _onItemSelected,
      onHomePressed: _goToHome,
      child: _pages[_selectedIndex],
    );
  }
}
