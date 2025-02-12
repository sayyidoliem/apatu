import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:core/core.dart';
import 'package:scanner/scanner.dart';

void main() {
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
      GoRoute(
        name: RESULT_PAGE_ROUTE,
        path: '/result',
        builder: (context, state) {
          return ResultPage();
        },
      )
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
