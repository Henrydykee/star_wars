

import 'package:auto_route/auto_route_annotations.dart';
import 'package:star_wars/views/home.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AdaptiveRoute(page: HomePage, initial: true),

])
class $Router {}