import 'package:go_router/go_router.dart';
import 'package:one_second_everyday/modules/home/home_router.dart';
import 'package:one_second_everyday/modules/video_selector/video_selector_router.dart';

GoRouter appRoutes = GoRouter(
  routes: [
    ...HomeRouter.routes,
    ...VideoSelectorRouter.routes,
  ],
);
