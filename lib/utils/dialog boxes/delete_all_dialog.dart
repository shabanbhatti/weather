

import 'package:flutter/material.dart';

void showDeleteAllDialog(BuildContext context, VoidCallback onConfirm) {
  showDialog(
    context: context,
    builder:
        (ctx) => AlertDialog(
          title: const Text('Delete All?'),
          content: const Text('Are you sure you want to delete all?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                onConfirm();
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
  );
}
