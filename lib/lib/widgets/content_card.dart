import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final String title;
  final Widget child;
  final IconData? icon;

  const ContentCard({
    super.key,
    required this.title,
    required this.child,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardTheme = theme.cardTheme;
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: cardTheme.elevation ?? 2.0, // Use theme elevation or default
      shape:
          cardTheme.shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      color:
          cardTheme.color ??
          colorScheme.surface, // Use theme card color or surface
      margin:
          cardTheme.margin ??
          const EdgeInsets.symmetric(
            vertical: 8.0,
          ), // Use theme margin or default
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                if (icon != null) ...[
                  Icon(
                    icon,
                    color: colorScheme.primary,
                    size: 28,
                  ), // Slightly larger icon
                  const SizedBox(width: 12), // Increased spacing
                ],
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: colorScheme
                          .onSurface, // Ensure good contrast on surface
                      fontWeight: FontWeight.bold, // Make title bolder
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16), // Increased spacing
            child, // The main content of the card
          ],
        ),
      ),
    );
  }
}
