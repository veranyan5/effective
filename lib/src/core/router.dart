import 'package:go_router/go_router.dart';

import '../features/home/presentation/pages/home_page.dart';
import '../features/search/presentation/pages/search_page.dart';
import 'placeholder_screen.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        path: '/placeholder',
        builder: (context, state) => const PlaceholderScreen(),
      ),
    ],
  );
}
