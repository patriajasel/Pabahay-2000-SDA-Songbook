import 'package:church_songbook_app/modules/home/presentation/components/ay_songs_tab.dart';
import 'package:church_songbook_app/modules/home/presentation/components/hymnal_tab.dart';
import 'package:church_songbook_app/modules/home/presentation/components/response_hyms_tab.dart';
import 'package:church_songbook_app/modules/home/presentation/components/special_songs_tab.dart';
import 'package:church_songbook_app/modules/home/presentation/page/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final appRouter = GoRouter(
    initialLocation: "/hymnal",
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomePage(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/hymnal',
                builder: (context, state) => const HymnalTab(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/response',
                builder: (context, state) => const ResponseTab(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/special',
                builder: (context, state) => const SpecialTab(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/ay', builder: (context, state) => const AYTab()),
            ],
          ),
        ],
      ),
    ],
  );
}
