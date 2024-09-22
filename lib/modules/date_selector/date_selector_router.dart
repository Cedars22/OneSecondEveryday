import 'package:go_router/go_router.dart';
import 'package:one_second_everyday/modules/date_selector/pages/select_media_page.dart';

import 'pages/add_media_page.dart';
import 'pages/date_selector_page.dart';

class DateSelectorRouter {
  static String videoSelectorPage = '/video_selector';
  static String videoAddMediaPage = '/add_media';
  static String selectMediaPage = '/select_media';

  static final List<GoRoute> routes = [
    GoRoute(
      path: videoSelectorPage,
      builder: (context, state) => const DateSelectorPage(),
    ),
    GoRoute(
      path: videoAddMediaPage,
      builder: (context, state) => AddMedia(
        date: state.extra as DateTime,
      ),
    ),
    GoRoute(
      path: selectMediaPage,
      builder: (context, state) => SelectMediaPage(
        date: state.extra as DateTime,
      ),
    )
  ];
}
