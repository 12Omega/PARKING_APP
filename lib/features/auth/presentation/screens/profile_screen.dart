import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Helper method to create styled ListTiles
  Widget _buildProfileListTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive =
        false, // For items like "Delete Account" if added later
  }) {
    final theme = Theme.of(context);
    Color iconColor = isDestructive
        ? theme.colorScheme.error
        : theme.colorScheme.primary;
    Color textColor = isDestructive
        ? theme.colorScheme.error
        : theme.colorScheme.onSurface;

    return ListTile(
      leading: Icon(icon, color: iconColor, size: 24), // Standard size
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(color: textColor),
      ),
      trailing: isDestructive
          ? null
          : Icon(
              Icons.chevron_right,
              color: theme.colorScheme.outline,
              size: 22,
            ),
      onTap: onTap,
      // contentPadding: EdgeInsets.symmetric(horizontal: 0), // Can adjust if needed
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        // User Information Section
        Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Icon(
                Icons.person_outline,
                size: 50,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'User Name', // Placeholder
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'user.email@example.com', // Placeholder
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),

        // Account Settings Section
        Text(
          'Account Settings',
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(thickness: 1, height: 16),
        _buildProfileListTile(
          context: context,
          icon: Icons.edit_outlined,
          title: 'Edit Profile',
          onTap: () {
            debugPrint('Edit Profile tapped');
            // TODO: Navigate to edit profile screen
          },
        ),
        _buildProfileListTile(
          context: context,
          icon: Icons.lock_outline,
          title: 'Change Password',
          onTap: () {
            debugPrint('Change Password tapped');
            // TODO: Navigate to change password screen
          },
        ),
        _buildProfileListTile(
          context: context,
          icon: Icons.payment_outlined,
          title: 'Payment Methods',
          onTap: () {
            debugPrint('Payment Methods tapped');
            // TODO: Navigate to payment methods screen
          },
        ),

        const SizedBox(height: 24),

        // Preferences Section
        Text(
          'Preferences',
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(thickness: 1, height: 16),
        _buildProfileListTile(
          context: context,
          icon: Icons.notifications_outlined,
          title: 'Notifications',
          onTap: () {
            debugPrint('Notifications tapped');
            // TODO: Navigate to notifications settings screen
          },
        ),
        _buildProfileListTile(
          context: context,
          icon: Icons.palette_outlined,
          title: 'Appearance', // Changed from Theme Settings
          onTap: () {
            debugPrint('Appearance tapped');
            // TODO: Navigate to theme/appearance settings screen
          },
        ),
        _buildProfileListTile(
          context: context,
          icon: Icons.language_outlined,
          title: 'Language',
          onTap: () {
            debugPrint('Language tapped');
            // TODO: Navigate to language settings screen
          },
        ),

        const SizedBox(height: 24),

        // Support & Legal Section
        Text(
          'Support & Legal',
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(thickness: 1, height: 16),
        _buildProfileListTile(
          context: context,
          icon: Icons.help_outline,
          title: 'Help & FAQ',
          onTap: () {
            debugPrint('Help & FAQ tapped');
            // TODO: Navigate to Help & FAQ screen
          },
        ),
        _buildProfileListTile(
          context: context,
          icon: Icons.email_outlined,
          title: 'Contact Us',
          onTap: () {
            debugPrint('Contact Us tapped');
            // TODO: Navigate to contact us screen or action
          },
        ),
        _buildProfileListTile(
          context: context,
          icon: Icons.description_outlined,
          title: 'Terms of Service',
          onTap: () {
            debugPrint('Terms of Service tapped');
            // TODO: Show Terms of Service
          },
        ),
        _buildProfileListTile(
          context: context,
          icon: Icons.shield_outlined,
          title: 'Privacy Policy',
          onTap: () {
            debugPrint('Privacy Policy tapped');
            // TODO: Show Privacy Policy
          },
        ),

        const SizedBox(height: 30),
        Center(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.logout),
            label: const Text('Log Out'),
            onPressed: () {
              debugPrint('Log Out Tapped');
              // TODO: Implement logout functionality
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  theme.colorScheme.error, // More prominent error color
              foregroundColor: theme.colorScheme.onError,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              textStyle: theme.textTheme.labelLarge,
            ),
          ),
        ),
        const SizedBox(height: 16), // Some padding at the bottom
      ],
    );
  }
}
