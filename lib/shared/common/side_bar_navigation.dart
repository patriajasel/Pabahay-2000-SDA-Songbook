import 'package:church_songbook_app/shared/theme/app_theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBarNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const SideBarNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SidebarXController(
      selectedIndex: selectedIndex,
      extended: false,
    );

    // Listen to changes and call callback
    controller.addListener(() {
      onItemSelected(controller.selectedIndex);
    });

    return SidebarX(
      controller: controller,
      showToggleButton: false,
      theme: SidebarXTheme(
        width: 80.w,
        margin: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.shadow.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        itemMargin: EdgeInsets.all(6.w),
        selectedItemMargin: EdgeInsets.all(6.w),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: context.colorScheme.primary,
        ),
      ),
      items: [
        SidebarXItem(
          iconBuilder: (selected, hovered) => Image.asset(
            'lib/shared/assets/hymnal_logo.png',
            height: 44.h,
            width: 44.w,
            color: selected ? Colors.white : null,
          ),
        ),
        SidebarXItem(
          iconBuilder: (selected, hovered) => Image.asset(
            'lib/shared/assets/response_hymns_logo.png',
            height: 44.h,
            width: 44.w,
            color: selected ? Colors.white : null,
          ),
        ),
        SidebarXItem(
          iconBuilder: (selected, hovered) => Image.asset(
            'lib/shared/assets/special_songs_logo.png',
            height: 44.h,
            width: 44.w,
            color: selected ? Colors.white : null,
          ),
        ),
      ],
      footerItems: [
        SidebarXItem(
          iconBuilder: (selected, hovered) => Icon(
            Icons.music_note_rounded,
            color: selected ? Colors.white : context.colorScheme.primary,
            size: 24.sp,
          ),
        ),
      ],
    );
  }
}
