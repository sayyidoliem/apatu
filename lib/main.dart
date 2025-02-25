import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:core/core.dart';
import 'package:scanner/presentation/database/profile.dart';
import 'package:scanner/presentation/page/profile_screen.dart';
import 'package:scanner/scanner.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileAdapter());
  boxProfiles = await Hive.openBox<Profile>('profileBox');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: SCANNER_PAGE_ROUTE,
        path: '/',
        builder: (context, state) {
          return ScannerPage();
        },
      ),
      GoRoute(path: path)
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Apatu Apps(demo)',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
