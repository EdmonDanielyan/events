import 'package:flutter/material.dart';
import 'package:ink_mobile/components/loader/custom_circular_progress_indicator.dart';

class CustomAlertLoading {
  final BuildContext context;

  const CustomAlertLoading(this.context);

  void call() {
    showDialog(
      context: context,
      builder: (_) => const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(child: CustomCircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
