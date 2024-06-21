import 'package:flutter/material.dart';

class SellHouseScreen extends StatelessWidget {
  const SellHouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell My House', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'House Title',
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Location',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Placeholder action for submitting house details
                _submitHouseDetails(context);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitHouseDetails(BuildContext context) {
    // Replace this with actual logic to submit house details
    // For example, you can use a provider or bloc to handle submission.
    // Here's a placeholder showing a snackbar message.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('House details submitted for admin approval.'),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
