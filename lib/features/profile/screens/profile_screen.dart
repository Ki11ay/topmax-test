import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../state/auth_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          children: [
            const SizedBox(height: AppConstants.paddingMedium),
            CircleAvatar(
              radius: 50,
              backgroundColor: AppConstants.primaryBlue,
              child: Text(
                user?.phone.substring(0, 2).toUpperCase() ?? 'U',
                style: const TextStyle(
                  fontSize: AppConstants.fontSizeTitle,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: AppConstants.paddingMedium),
            Text(
              user?.phone ?? 'User',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            if (user?.email != null) ...[
              const SizedBox(height: AppConstants.paddingSmall),
              Text(
                user!.email!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppConstants.textSecondary,
                    ),
              ),
            ],
            const SizedBox(height: AppConstants.paddingLarge),
            _buildProfileOption(
              context,
              icon: Icons.person,
              title: 'Edit Profile',
              onTap: () {},
            ),
            _buildProfileOption(
              context,
              icon: Icons.work,
              title: 'My Applications',
              onTap: () {},
            ),
            _buildProfileOption(
              context,
              icon: Icons.bookmark,
              title: 'Saved Jobs',
              onTap: () {},
            ),
            _buildProfileOption(
              context,
              icon: Icons.school,
              title: 'My Courses',
              onTap: () {},
            ),
            _buildProfileOption(
              context,
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {},
            ),
            const SizedBox(height: AppConstants.paddingMedium),
            _buildProfileOption(
              context,
              icon: Icons.logout,
              title: 'Logout',
              isDestructive: true,
              onTap: () async {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text(
                          'Logout',
                          style: TextStyle(color: AppConstants.errorColor),
                        ),
                      ),
                    ],
                  ),
                );

                if (confirmed == true && context.mounted) {
                  await ref.read(authProvider.notifier).logout();
                  
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('✓ Logged out successfully'),
                        backgroundColor: AppConstants.successColor,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    
                    // Navigate to phone input
                    context.go('/auth/phone');
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingSmall),
      child: ListTile(
        leading: Icon(
          icon,
          color: isDestructive ? AppConstants.errorColor : AppConstants.primaryBlue,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isDestructive ? AppConstants.errorColor : null,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

