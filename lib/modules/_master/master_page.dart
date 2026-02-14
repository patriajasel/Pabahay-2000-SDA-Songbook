import 'package:church_songbook_app/infra/router/app_router.dart';
import 'package:flutter/material.dart';

class MasterPage extends StatelessWidget {
  const MasterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(routerConfig: appRouter.appRouter);
  }
}
