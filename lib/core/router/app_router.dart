import 'package:go_router/go_router.dart';
import 'package:one_second_everyday/modules/home/home_router.dart';
import 'package:one_second_everyday/modules/date_selector/date_selector_router.dart';

GoRouter appRoutes = GoRouter(
  routes: [
    ...HomeRouter.routes,
    ...DateSelectorRouter.routes,
  ],
);
