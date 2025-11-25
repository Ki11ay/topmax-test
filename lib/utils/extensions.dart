import 'package:intl/intl.dart';

extension StringExtension on String {
  // Capitalize first letter
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  // Truncate string with ellipsis
  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }

  // Check if string is a valid number
  bool get isNumeric {
    return double.tryParse(this) != null;
  }
}

extension DateTimeExtension on DateTime {
  // Format date as '01 Jan 2025'
  String toFormattedDate() {
    return DateFormat('dd MMM yyyy').format(this);
  }

  // Format date as 'January 1, 2025'
  String toFullDate() {
    return DateFormat('MMMM d, yyyy').format(this);
  }

  // Get time ago (e.g., "2 days ago")
  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '${years} year${years > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '${months} month${months > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  // Format time as '10:30 AM'
  String toFormattedTime() {
    return DateFormat('hh:mm a').format(this);
  }
}

extension IntExtension on int {
  // Format number with commas (e.g., 1000 -> "1,000")
  String toFormattedString() {
    return NumberFormat('#,##0').format(this);
  }
}

extension DoubleExtension on double {
  // Format as currency (e.g., 1000.0 -> "AED 1,000")
  String toCurrency([String currency = 'AED']) {
    return '$currency ${toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        )}';
  }
}

