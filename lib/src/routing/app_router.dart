import 'package:flutter/material.dart';
import 'package:flutter_template/src/features/home/sample_item_list_screen.dart';
import 'package:go_router/go_router.dart';

import '../features/item/sample_item_details_view.dart';
import '../features/not_found/not_found_screen.dart';

enum AppRoute { home, item, settings}

//nesting subroutes means that a back button is displayed on the app toolbar
//Note: we dont add the / to cart route.  Go router takes care of this
final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SampleItemListView(), routes:  [
      // GoRoute(
      //   path: 'item',
      //   name: AppRoute.leaveReview.name,
      //   pageBuilder: (context, state) {
      //     final productId = state.params['id']!;
      //     return MaterialPage(
      //       key: state.pageKey,
      //       fullscreenDialog: true,
      //       child: SampleItemDetailsView(productId: productId),
      //     );
      //   },
      // ),
    ]),
  ],
  errorBuilder: (context, state) {
    //custom error screen
    return const NotFoundScreen();
  },
);
