import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_sip/core/go_router_observer.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    observers: [GoRouterObserver()], // remove it in production
    initialLocation: '/home/start',
    routes: [
      GoRoute(
        path: '/home/settings',
        builder: (context, state) {
          return Container(
            color: Colors.amber,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => context.push('/home/start'),
                  child: const Text('Go to Start'),
                ),
                TextButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.push('/home/start');
                    }
                  },
                  child: const Text('Go Back'),
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
                  onPressed: () => context.push('/home/settings'),
                  child: const Text('Go to Setttings'),
                ),
                TextButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.push('/home/settings');
                    }
                  },
                  child: const Text('Go Back'),
                ),
              ],
            ),
          );
        },
      )
    ]);
