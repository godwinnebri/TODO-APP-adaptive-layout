import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/2_application/pages/dashboard/dashboard_page.dart';
import 'package:todo_app/2_application/pages/home/home_page.dart';
import 'package:todo_app/2_application/pages/settings/settings_page.dart';
import 'package:todo_app/core/go_router_observer.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

const String _basePath = '/beginning';

final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '$_basePath/${DashboardPage.pageConfig.name}',
  observers: [GoRouterObserver()],
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          name: HomePage.pageConfig.name,
          path: '$_basePath/:tab',
          builder: (context, state) => HomePage(
            key: state.pageKey,
            tab: state.pathParameters['tab']!,
          ),
        ),
      ],
    ),
    GoRoute(
      name: SettingsPage.pageConfig.name,
      path: '$_basePath=/${SettingsPage.pageConfig.name}',
      builder: (context, state) {
        return const SettingsPage();
      },
    ),
  ],
);
