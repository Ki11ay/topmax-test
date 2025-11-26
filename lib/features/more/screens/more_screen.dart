import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          children: [
            _buildSection(
              context,
              title: 'Browse',
              items: [
                _buildMenuItem(
                  context,
                  icon: Icons.school,
                  title: 'All Courses',
                  onTap: () => context.push('/courses'),
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.bookmark,
                  title: 'Bookmarks',
                  onTap: () => context.push('/saved-items'),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.paddingMedium),
            _buildSection(
              context,
              title: 'Settings',
              items: [
                _buildMenuItem(
                  context,
                  icon: Icons.notifications,
                  title: 'Notifications',
                  onTap: () {},
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.language,
                  title: 'Language',
                  onTap: () {},
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.privacy_tip,
                  title: 'Privacy Policy',
                  onTap: () {},
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.description,
                  title: 'Terms & Conditions',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: AppConstants.paddingMedium),
            _buildSection(
              context,
              title: 'Support',
              items: [
                _buildMenuItem(
                  context,
                  icon: Icons.help,
                  title: 'Help Center',
                  onTap: () {},
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.info,
                  title: 'About',
                  onTap: () {},
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.contact_support,
                  title: 'Contact Us',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppConstants.paddingSmall,
            bottom: AppConstants.paddingSmall,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppConstants.textSecondary,
                ),
          ),
        ),
        Card(
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppConstants.primaryBlue),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
