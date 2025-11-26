import 'dart:async';
import 'package:flutter/material.dart';

/// Manages session expiry events across the app
class SessionManager {
  static final SessionManager _instance = SessionManager._internal();
  factory SessionManager() => _instance;

  SessionManager._internal();

  // Stream controller for session expiry events
  final _sessionExpiredController = StreamController<String>.broadcast();

  /// Stream of session expiry events with optional error messages
  Stream<String> get onSessionExpired => _sessionExpiredController.stream;

  /// Notify that the session has expired
  void notifySessionExpired([String? message]) {
    final msg = message ?? 'Your session has expired. Please log in again.';
    _sessionExpiredController.add(msg);
  }

  /// Show a user-friendly dialog when session expires
  static void showSessionExpiredDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.info_outline, color: Colors.orange, size: 28),
            SizedBox(width: 12),
            Text('Session Expired'),
          ],
        ),
        content: Text(
          message,
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'OK',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  /// Show a user-friendly snackbar when session expires
  static void showSessionExpiredSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.info_outline, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.orange.shade700,
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  /// Dispose the stream controller
  void dispose() {
    _sessionExpiredController.close();
  }
}

