import 'package:flutter/material.dart';
import '../models/property.dart';

class PropertyDetailsScreen extends StatelessWidget {
  final Property property;

  const PropertyDetailsScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(property.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(property.title, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text(property.location, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Price: ${property.price}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(property.description),
          ],
        ),
      ),
    );
  }
}
