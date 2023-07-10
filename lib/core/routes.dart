import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/go_router_observer.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home/tasks',
  observers: [GoRouterObserver()],
  routes: [
    GoRoute(
      path: '/home/settings',
      builder: (context, state) {
        return Container(
          color: Colors.amber,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => context.push('/home/tasks'),
                child: const Text(
                  'GO TO TASKS',
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => context.push('/home/start'),
                child: const Text(
                  'GO TO START',
                ),
              ),
              TextButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.push('/home/start');
                  }
                },
                child: const Text('GO BACK'),
              ),
            ],
          ),
        );
      },
    ),
    GoRoute(
      path: '/home/start',
      builder: (context, state) {
        return Container(
          color: Colors.blueGrey,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => context.push('/home/tasks'),
                child: const Text(
                  'GO TO TASKS',
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => context.push('/home/settings'),
                child: const Text(
                  'GO TO SETTINGS',
                ),
              ),
              TextButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.push('/home/settings');
                  }
                },
                child: const Text('GO BACK'),
              ),
            ],
          ),
        );
      },
    ),
    GoRoute(
      path: '/home/tasks',
      builder: (context, state) {
        return Container(
          color: Colors.green,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => context.push('/home/settings'),
                child: const Text(
                  'GO TO SETTINGS',
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => context.push('/home/settings'),
                child: const Text(
                  'GO TO START',
                ),
              ),
              TextButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.push('/home/settings');
                  }
                },
                child: const Text('GO BACK'),
              ),
            ],
          ),
        );
      },
    ),
  ],
);
