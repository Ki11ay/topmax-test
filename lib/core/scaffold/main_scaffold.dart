import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_bottom_nav.dart';

class MainScaffold extends StatefulWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/explore');
        break;
      case 2:
        // Post Job - handled by dialog in CustomBottomNav
        break;
      case 3:
        context.go('/profile');
        break;
      case 4:
        context.go('/more');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Update current index based on current route
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/home')) {
      _currentIndex = 0;
    } else if (location.startsWith('/explore')) {
      _currentIndex = 1;
    } else if (location.startsWith('/profile')) {
      _currentIndex = 3;
    } else if (location.startsWith('/more')) {
      _currentIndex = 4;
    }

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}

