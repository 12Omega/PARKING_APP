import 'package:flutter/material.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  // Example Placeholder Data - moved to state for potential future filtering
  // For now, filtering logic is not applied to this list.
  final List<Map<String, String>> _allBookings = List.generate(
    8,
    (index) => {
      'id': 'booking_$index',
      'parkingLot': 'Lot A-${index + 1} (Downtown)',
      'date': '2024-07-${20 + index}',
      'time': '1${index}:00 - 1${index + 2}:00 PM',
      'status': index % 3 == 0 ? 'Confirmed' : (index % 3 == 1 ? 'Pending' : 'Cancelled'),
    },
  );

  // State for selected filter
  String _selectedStatusFilter = 'All';
  final List<String> _filterStatuses = ['All', 'Confirmed', 'Pending', 'Cancelled'];

  // In a real app, this would filter _allBookings based on _selectedStatusFilter
  List<Map<String, String>> get _filteredBookings {
    if (_selectedStatusFilter == 'All') {
      return _allBookings;
    }
    return _allBookings.where((booking) => booking['status'] == _selectedStatusFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentBookings = _filteredBookings; // Use the filtered list

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          child: SizedBox( // Constrain the height of the chip row
            height: 40,
            child: ListView.separated( // Use ListView for horizontal scrolling if many chips
              scrollDirection: Axis.horizontal,
              itemCount: _filterStatuses.length,
              itemBuilder: (context, index) {
                final status = _filterStatuses[index];
                final isSelected = _selectedStatusFilter == status;
                return ChoiceChip(
                  label: Text(status),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _selectedStatusFilter = status;
                        // Filtering is now handled by the _filteredBookings getter
                      });
                    }
                  },
                  selectedColor: theme.colorScheme.primary,
                  labelStyle: TextStyle(
                    color: isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.onSurfaceVariant,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  backgroundColor: theme.colorScheme.surfaceVariant.withOpacity(0.5),
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outlineVariant,
                      width: 1.0,
                    ),
                  ),
                  elevation: isSelected ? 2.0 : 0.0,
                  pressElevation: 4.0,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            ),
          ),
        ),
        Expanded(
          child: currentBookings.isEmpty
              ? Center(
                  child: Text(
                    _selectedStatusFilter == 'All'
                        ? 'No bookings yet.'
                        : 'No bookings found for "$_selectedStatusFilter".',
                    style: theme.textTheme.titleMedium,
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  itemCount: currentBookings.length,
                  itemBuilder: (context, index) {
                    final booking = currentBookings[index];
                    final isConfirmed = booking['status']! == 'Confirmed';
                    final isPending = booking['status']! == 'Pending';
                    final isCancelled = booking['status']! == 'Cancelled';

                    Color statusColor;
                    IconData statusIcon;

                    if (isConfirmed) {
                      statusColor = Colors.green.shade700;
                      statusIcon = Icons.check_circle;
                    } else if (isPending) {
                      statusColor = theme.colorScheme.tertiary;
                      statusIcon = Icons.hourglass_top_rounded;
                    } else { // Cancelled
                      statusColor = theme.colorScheme.error;
                      statusIcon = Icons.cancel;
                    }

                    return Card(
                      elevation: theme.cardTheme.elevation ?? 1.0, // Subtle elevation
                      margin: theme.cardTheme.margin ?? const EdgeInsets.symmetric(vertical: 6.0),
                      shape: theme.cardTheme.shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                      color: theme.cardTheme.color ?? theme.colorScheme.surface,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              booking['parkingLot']!,
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.calendar_today, size: 16, color: theme.textTheme.bodySmall?.color?.withOpacity(0.7)),
                                const SizedBox(width: 8),
                                Text('Date: ${booking['date']!}', style: theme.textTheme.bodyMedium),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.access_time, size: 16, color: theme.textTheme.bodySmall?.color?.withOpacity(0.7)),
                                const SizedBox(width: 8),
                                Text('Time: ${booking['time']!}', style: theme.textTheme.bodyMedium),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Icon(statusIcon, color: statusColor, size: 20),
                                    const SizedBox(width: 8),
                                    Text(
                                      booking['status']!,
                                      style: theme.textTheme.titleSmall?.copyWith(
                                        color: statusColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                if (isPending || isConfirmed)
                                  TextButton(
                                    child: Text(isConfirmed ? 'View Details' : 'Manage'),
                                    onPressed: () { /* TODO: Action */ },
                                  )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
