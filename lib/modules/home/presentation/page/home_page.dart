import 'package:church_songbook_app/widget/app_bar/app_bar.widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const HomePage({super.key, required this.navigationShell});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> _tabs = [
    const Tab(icon: Icon(Icons.menu_book), text: 'SDA Hymnal'),
    const Tab(icon: Icon(Icons.music_note), text: 'Response Hymns'),
    const Tab(icon: Icon(Icons.star), text: 'Special Songs'),
    const Tab(icon: Icon(Icons.groups), text: 'AY Songs'),
  ];

  final List<String> _routes = ['/hymnal', '/response', '/special', '/ay'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: widget.navigationShell.currentIndex,
    );

    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (!_tabController.indexIsChanging) {
      context.go(_routes[_tabController.index]);
    }
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.navigationShell.currentIndex != _tabController.index) {
      _tabController.index = widget.navigationShell.currentIndex;
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(controller: _tabController, tabs: _tabs),
      body: widget.navigationShell,
    );
  }
}
