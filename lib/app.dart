import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_wave/config/routes/named_routes.dart';
import 'package:wealth_wave/config/theme/default_theme.dart';
import 'package:wealth_wave/features/auth/presentation/pages/create_account_screen.dart';
import 'package:wealth_wave/features/auth/presentation/pages/login_screen.dart';
import 'package:wealth_wave/features/home/presentation/widgets/home_page_view_state.dart';
import 'package:wealth_wave/features/onboarding/presentation/helpers/transitions/page_transition.dart';
import 'package:wealth_wave/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:wealth_wave/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:wealth_wave/features/wallet/wallet_page.dart';
import 'package:wealth_wave/features/profile/profile_page.dart';
import 'package:wealth_wave/features/statistics/stats_page.dart';

class App extends StatelessWidget {
  App({super.key});

  // Centralized transition configuration
  static const _transitionDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(inputDecorationTheme: defaultInputDecorationTheme),
      ),
    );
  }

  // Factory for creating page transitions with consistent behavior
  static Page _buildPage<T>({
    required LocalKey key,
    required Widget child,
    required PageTransitions transitions,
  }) {
    return CustomTransitionPage<T>(
      key: key,
      child: child,
      transitionDuration: _transitionDuration,
      reverseTransitionDuration: _transitionDuration,
      transitionsBuilder: transitions.builder,
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: NamedRoutes.splash,
        path: '/',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const SplashScreen()),
      ),
      GoRoute(
        name: NamedRoutes.onboarding,
        path: '/onboarding',
        pageBuilder: (context, state) => _buildPage(
          key: state.pageKey,
          child: const OnboardingScreen(),
          transitions: PageTransitions.slideFromRight,
        ),
      ),
      GoRoute(
        name: NamedRoutes.signup,
        path: '/signup',
        pageBuilder: (context, state) => _buildPage(
          key: state.pageKey,
          child: CreateAccountScreen(),
          transitions: PageTransitions.fade,
        ),
      ),
      GoRoute(
        name: NamedRoutes.login,
        path: '/login',
        pageBuilder: (context, state) => _buildPage(
          key: state.pageKey,
          child: LoginScreen(),
          transitions: PageTransitions.fadeThrough,
        ),
      ),
      GoRoute(
        name: NamedRoutes.home,
        path: '/home', // Fixed: absolute path
        pageBuilder: (context, state) => _buildPage(
          key: state.pageKey,
          child: HomePageViewState(),
          transitions: PageTransitions.slideFromBottom,
        ),
      ),
      GoRoute(
        name: NamedRoutes.wallet,
        path: '/wallet',
        pageBuilder: (context, state) => _buildPage(
          key: state.pageKey,
          child: const WalletPage(),
          transitions: PageTransitions.slideFromBottom,
        ),
      ),
      GoRoute(
        name: NamedRoutes.profile,
        path: '/profile',
        pageBuilder: (context, state) => _buildPage(
          key: state.pageKey,
          child: const ProfilePage(),
          transitions: PageTransitions.slideFromBottom,
        ),
      ),
      GoRoute(
        name: NamedRoutes.stats,
        path: '/stats',
        pageBuilder: (context, state) => _buildPage(
          key: state.pageKey,
          child: const StatsPage(),
          transitions: PageTransitions.slideFromBottom,
        ),
      ),
    ],
    // Optional: global error handling
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
