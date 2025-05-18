// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [DetailScreen]
class DetailRoute extends PageRouteInfo<DetailRouteArgs> {
  DetailRoute({required Post post, List<PageRouteInfo>? children})
    : super(
        DetailRoute.name,
        args: DetailRouteArgs(post: post),
        initialChildren: children,
      );

  static const String name = 'DetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailRouteArgs>();
      return DetailScreen(post: args.post);
    },
  );
}

class DetailRouteArgs {
  const DetailRouteArgs({required this.post});

  final Post post;

  @override
  String toString() {
    return 'DetailRouteArgs{post: $post}';
  }
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [NavbarScreen]
class NavbarRoute extends PageRouteInfo<void> {
  const NavbarRoute({List<PageRouteInfo>? children})
    : super(NavbarRoute.name, initialChildren: children);

  static const String name = 'NavbarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NavbarScreen();
    },
  );
}
