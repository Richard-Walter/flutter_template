import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key, required this.itemId});

  final String itemId;
  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Item Details for Item $itemId'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
