import 'package:flutter/material.dart';
import 'package:parking_app/widgets/content_card.dart'; // Import ContentCard

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        Text(
          'Welcome to Your Dashboard!',
          style: theme.textTheme.headlineSmall,
        ),
        const SizedBox(height: 24),

        // Replaced first Container with ContentCard
        ContentCard(
          title: 'Available Parking Spots',
          icon: Icons.local_parking, // Example icon
          child: Text(
            'Details about available parking spots will go here. This card demonstrates the reusable ContentCard widget. You can see real-time availability and book your preferred spot directly from the app.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme
                  .colorScheme
                  .onSurfaceVariant, // Slightly less prominent than onSurface
            ),
          ),
        ),
        const SizedBox(height: 16), // Standard spacing between cards
        // Replaced second Container with ContentCard
        ContentCard(
          title: 'Quick Actions',
          icon: Icons.touch_app, // Example icon
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align buttons to the start
            children: <Widget>[
              Text(
                'Easily manage your parking needs with these quick actions:',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                // Using a Row for buttons to appear side-by-side if space allows, or wrap
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () {
                      // TODO: Implement navigation or action
                    },
                    label: const Text('Book New Spot'),
                    // ElevatedButton will use global theme
                  ),
                  const SizedBox(width: 12),
                  TextButton.icon(
                    icon: const Icon(Icons.history),
                    onPressed: () {
                      // TODO: Implement navigation or action
                    },
                    label: const Text('View Bookings'),
                    // TextButton will use global theme
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Kept existing themed buttons for demonstration, or they can be removed
        // if the ContentCard examples are sufficient.
        Text('Other Themed Elements', style: theme.textTheme.titleMedium),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Sample Themed Button'),
        ),
        const SizedBox(height: 12),
        TextButton(
          onPressed: () {},
          child: const Text('Sample Themed Text Button'),
        ),
      ],
    );
  }
}
