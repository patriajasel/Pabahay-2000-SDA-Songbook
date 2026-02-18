import 'package:church_songbook_app/modules/home/presentation/components/home_tabs.dart';
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
                builder: (context, state) => const ResponseHymsTab(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/special',
                builder: (context, state) => const SpecialSongsTab(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/ay',
                builder: (context, state) => const AYSongsTab(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
