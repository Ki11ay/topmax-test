import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  void _showPostJobDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Post Job'),
        content: const Text('Only companies can post jobs.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingSmall,
            vertical: AppConstants.paddingSmall,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context: context,
                icon: Image.asset('assets/icons/home2.png', width: 20, height: 20),
                activeIcon: Image.asset('assets/icons/home3.png', width: 20, height: 20),
                label: 'Home',
                index: 0,
                isActive: currentIndex == 0,
              ),
              _buildNavItem(
                context: context,
                icon: Image.asset('assets/icons/search2.png', width: 20, height: 20),
                activeIcon: Image.asset('assets/icons/search3.png', width: 20, height: 20),
                label: 'Explore',
                index: 1,
                isActive: currentIndex == 1,
              ),
              _buildPostJobButton(context),
              _buildNavItem(
                context: context,
                icon: Icons.person_outline,
                activeIcon: Icons.person,
                label: 'Profile',
                index: 3,
                isActive: currentIndex == 3,
              ),
              _buildNavItem(
                context: context,
                icon: Image.asset('assets/icons/more.png', width: 20, height: 20),
                activeIcon: Image.asset('assets/icons/more.png', width: 20, height: 20),
                label: 'More',
                index: 4,
                isActive: currentIndex == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required dynamic icon,
    required dynamic activeIcon,
    required String label,
    required int index,
    required bool isActive,
  }) {
    final iconWidget = isActive ? activeIcon : icon;
    
    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconWidget is IconData
                ? Icon(
                    iconWidget,
                    color: isActive
                        ? AppConstants.primaryBlue
                        : AppConstants.textSecondary,
                    size: AppConstants.iconSizeMedium,
                  )
                : ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      isActive
                          ? AppConstants.primaryBlue
                          : AppConstants.textSecondary,
                      BlendMode.srcIn,
                    ),
                    child: iconWidget,
                  ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: AppConstants.fontSizeSmall,
                color: isActive
                    ? AppConstants.primaryBlue
                    : AppConstants.textSecondary,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostJobButton(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => _showPostJobDialog(context),
        child: Container(
              padding: const EdgeInsets.all(AppConstants.paddingSmall),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF3170CE),
                    Color(0xFF31B2CE),
                  ],
                ),
                borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
              ),
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/postjob.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Post Job',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppConstants.cardColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'DM Sans',
                    
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}

