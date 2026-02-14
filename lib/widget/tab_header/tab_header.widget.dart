import 'package:flutter/material.dart';

class TabHeaderWidget extends StatelessWidget {
  const TabHeaderWidget({
    super.key,
    required this.controller,
    required this.tabs,
  });

  final TabController controller;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 1)),
      ),
      child: TabBar(
        controller: controller,
        tabs: tabs,
        labelColor: const Color(0xFF2563EB),
        unselectedLabelColor: const Color(0xFF64748B),
        indicatorColor: const Color(0xFF2563EB),
        indicatorWeight: 3,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.hovered)) {
            return const Color(0xFF2563EB).withValues(alpha: 0.08);
          }
          if (states.contains(WidgetState.pressed)) {
            return const Color(0xFF2563EB).withValues(alpha: 0.12);
          }
          return null;
        }),
        splashFactory: InkRipple.splashFactory,
        dividerColor: Colors.transparent,
      ),
    );
  }
}
