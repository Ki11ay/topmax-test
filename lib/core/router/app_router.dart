import 'package:go_router/go_router.dart';
import '../../features/auth/screens/phone_input_screen.dart';
import '../../features/auth/screens/otp_verification_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/home/screens/job_details_screen.dart';
import '../../features/home/screens/courses_screen.dart';
import '../../features/home/screens/course_details_screen.dart';
import '../../features/explore/screens/explore_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/more/screens/more_screen.dart';
import '../../features/more/screens/saved_items_screen.dart';
import '../../services/storage_service.dart';
import '../scaffold/main_scaffold.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) async {
      final isLoggedIn = await StorageService.isLoggedIn();
      final isOnAuthPages = state.matchedLocation.startsWith('/auth');

      // If not logged in and not on auth pages, redirect to phone input
      if (!isLoggedIn && !isOnAuthPages) {
        return '/auth/phone';
      }

      // If logged in and on auth pages, redirect to home
      if (isLoggedIn && isOnAuthPages) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) async {
          final isLoggedIn = await StorageService.isLoggedIn();
          return isLoggedIn ? '/home' : '/auth/phone';
        },
      ),
      GoRoute(
        path: '/auth/phone',
        builder: (context, state) => const PhoneInputScreen(),
      ),
      GoRoute(
        path: '/auth/otp',
        builder: (context, state) {
          final phone = state.uri.queryParameters['phone'] ?? '';
          final countryId =
              int.tryParse(state.uri.queryParameters['countryId'] ?? '1') ?? 1;
          return OtpVerificationScreen(
            phone: phone,
            countryId: countryId,
          );
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MainScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/explore',
            builder: (context, state) => const ExploreScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: '/more',
            builder: (context, state) => const MoreScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/job/:id',
        builder: (context, state) {
          final jobId = int.parse(state.pathParameters['id']!);
          return JobDetailsScreen(jobId: jobId);
        },
      ),
      GoRoute(
        path: '/courses',
        builder: (context, state) => const CoursesScreen(),
      ),
      GoRoute(
        path: '/course/:id',
        builder: (context, state) {
          final courseId = int.parse(state.pathParameters['id']!);
          return CourseDetailsScreen(courseId: courseId);
        },
      ),
      GoRoute(
        path: '/saved-items',
        builder: (context, state) => const SavedItemsScreen(),
      ),
    ],
  );
}

