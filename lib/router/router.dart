import 'package:auto_route/auto_route.dart';

import '../data/model/post.dart';
import '../features/main/main_screen.dart';
import '../features/bottom_navigation_bar.dart';
import '../features/detail/detail_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: NavbarRoute.page, initial: true),
    AutoRoute(page: DetailRoute.page),
  ];
}
