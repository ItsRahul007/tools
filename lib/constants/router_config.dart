import 'package:go_router/go_router.dart';
import 'package:tools2/screens/error_page/error_page.dart';
import 'package:tools2/screens/facebook/facebook.dart';
import 'package:tools2/screens/home/home.dart';
import 'package:tools2/screens/instagram/instagram.dart';
import 'package:tools2/screens/x/x.dart';
import 'package:tools2/screens/youtube/youtube.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: "/", name: "home", builder: (context, state) => HomePage()),
    GoRoute(
      path: "/youtube",
      name: "youtube",
      pageBuilder: (context, state) => NoTransitionPage(child: Youtube()),
    ),
    GoRoute(
      path: "/facebook",
      name: "facebook",
      pageBuilder: (context, state) => NoTransitionPage(child: Facebook()),
    ),
    GoRoute(
      path: "/instagram",
      name: "instagram",
      pageBuilder: (context, state) => NoTransitionPage(child: Instagram()),
    ),
    GoRoute(
      path: "/x",
      name: "x",
      pageBuilder: (context, state) => NoTransitionPage(child: X()),
    ),
  ],
  errorBuilder: (context, state) => ErrorPage(error: state.error.toString()),
);
