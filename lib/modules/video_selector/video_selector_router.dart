import 'package:go_router/go_router.dart';

import 'pages/video_selector_page.dart';

class VideoSelectorRouter {
  static String videoSelectorPage = '/video_selector';

  static final List<GoRoute> routes = [
    GoRoute(
      path: videoSelectorPage,
      builder: (context, state) => const VideoSelectorPage(),
    ),
  ];
}
