import 'package:church_songbook_app/features/home/pages/hymnal/hymnal.dart';
import 'package:church_songbook_app/features/home/pages/response_hymns/response_hymns.dart';
import 'package:church_songbook_app/features/home/pages/song_editor/song_editor.dart';
import 'package:church_songbook_app/features/home/pages/special_songs/special_songs.dart';
import 'package:church_songbook_app/shared/common/app_layout_wrapper.dart';
import 'package:church_songbook_app/shared/common/glass_box.dart';
import 'package:church_songbook_app/shared/theme/app_theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayoutWrapper(
      onSettingsPressed: () {
        // Handle settings navigation
      },
      child: _buildMainContent(context),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogo(),
            SizedBox(width: 16.w),
            _buildTitle(context),
          ],
        ),

        SizedBox(height: 100.h),

        _buildSongbookFeatures(context),

        SizedBox(height: 100.h),

        _buildEditorButton(context),
      ],
    );
  }

  Widget _buildSongbookFeatures(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildFeatureButton(
          context,
          featureName: 'Hymnal',
          assetUrl: 'lib/shared/assets/hymnal_logo.png',
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Hymnal()),
          ),
        ),
        _buildFeatureButton(
          context,
          featureName: 'Response Hymns',
          assetUrl: 'lib/shared/assets/response_hymns_logo.png',
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ResponseHymns()),
          ),
        ),
        _buildFeatureButton(
          context,
          featureName: 'Special Songs',
          assetUrl: 'lib/shared/assets/special_songs_logo.png',
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SpecialSongs()),
          ),
        ),
      ],
    );
  }

  GlassBox _buildFeatureButton(
    BuildContext context, {
    required String assetUrl,
    required String featureName,
    VoidCallback? onPressed,
  }) {
    return GlassBox(
      onPressed: onPressed,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(assetUrl, height: 100.h, width: 100.w),
            Text(featureName, style: context.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buildEditorButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SongEditor()),
      ),
      icon: Icon(Icons.music_note),
      label: Text('Open Editor'),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      'lib/shared/assets/sda_logo.png',
      height: 350.h,
      width: 350.w,
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Pabahay 2000 SDA Church \nSongbook',
      style: context.titleLarge?.copyWith(
        shadows: [
          Shadow(
            offset: Offset(5, 5),
            blurRadius: 6,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
